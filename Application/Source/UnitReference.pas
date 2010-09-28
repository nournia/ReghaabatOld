unit UnitReference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvAppStyler, StdCtrls, ComCtrls, AdvGroupBox,
  AdvGlowButton, AdvEdit, UnitMaster, UnitTypes, StrUtils, clisted;

type
  TfResource = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvPanel1: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    gAuthor: TAdvGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    cbAuthor: TComboBox;
    cbPublication: TComboBox;
    gFile: TAdvGroupBox;
    Label4: TLabel;
    eFile: TButtonedEdit;
    gWebPage: TAdvGroupBox;
    Label2: TLabel;
    eLink: TEdit;
    mContent: TMemo;
    odMultiMeida: TOpenDialog;
    gProperties: TAdvGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    cbKind: TComboBox;
    eTitle: TEdit;
    cbAgeClass: TComboBox;
    AdvPanel2: TAdvPanel;
    bApply: TAdvGlowButton;
    clTags: TCheckListEdit;

    procedure refresh();
    function validate() : boolean;
    procedure loadData(id : integer);

    procedure cbKindChange(Sender: TObject);
    procedure eFileRightButtonClick(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    kind : TResourceContent; resourceId, creatorId : integer;
  end;

var
  fResource: TfResource;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfResource.refresh();
begin
  fMain.fillComboWithQuery(cbAgeClass, 'SELECT CONCAT(Title, " - ", Description) FROM ageclasses ORDER BY ID');
  fMain.fillComboWithQuery(cbAuthor, 'SELECT Title FROM authors ORDER BY ID');
  fMain.fillComboWithQuery(cbPublication, 'SELECT Title FROM publications ORDER BY ID');
  cbKind.ItemIndex := 0;
  cbAuthor.Text := '';
  cbPublication.Text := '';
  eTitle.Text := '';
  cbAgeClass.ItemIndex := 0;
  mContent.Text := '';
  eLink.Text := '';
  eFile.Text := '';
  cbKindChange(nil);
  resourceId := -1;
  creatorId := StrToInt(fMain.loginUserID);

  cbKind.SetFocus;
end;
function TfResource.validate() : boolean;
begin
  Result := (eTitle.Text <> '');
  if kind <> rWebPage then
  begin
    Result := Result and (cbAuthor.Text <> '');
    Result := Result and (cbPublication.Text <> '');
  end;
  if (kind = rAudio) or (kind = rVideo) then
  begin
    Result := Result and (FileExists(eFile.Text));
  end;

  if not Result then fMain.MyShowMessage('مقادیر وارد شده معتبر نیستند');
end;
procedure TfResource.loadData(id : integer);
begin
  refresh;
  resourceId := id;
  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT resources.Title AS Resource, authors.Title AS Author, publications.Title AS Publiation, resources.Kind, resources.AgeClass, resources.CreatorID, resources.Content, resources.Link, resources.FileType '+'FROM ((resources LEFT JOIN authors ON resources.AuthorID = authors.ID) LEFT JOIN publications ON resources.PublicationID = publications.ID) WHERE resources.ID = '+ IntToStr(resourceId);
    Open;

    cbKind.ItemIndex := Ord(StringToResource(FieldByName('Kind').AsString));
    cbAuthor.Text := FieldByName('Author').AsString;
    cbPublication.Text := FieldByName('Publiation').AsString;
    eTitle.Text := FieldByName('Resource').AsString;
    cbAgeClass.ItemIndex := FieldByName('AgeClass').AsInteger;
    mContent.Text := FieldByName('Content').AsString;
    eLink.Text := FieldByName('Link').AsString;
    if FieldByName('FileType').AsString <> '' then
      eFile.Text := fMain.resourceAddress + IntToStr(resourceId) + '.' + FieldByName('FileType').AsString;
    creatorId := FieldByName('CreatorID').AsInteger;
    cbKindChange(nil);
  end;
end;

// GUI
procedure TfResource.eFileRightButtonClick(Sender: TObject);
begin
  odMultiMeida.FileName := eFile.Text;
  if odMultiMeida.Execute then eFile.Text := odMultiMeida.FileName;
end;
procedure TfResource.cbKindChange(Sender: TObject);
begin
  kind := TResourceContent(cbKind.ItemIndex);

  gWebPage.Visible := kind = rWebPage;
  gFile.Visible := (kind = rAudio) or (kind = rVideo);
  gAuthor.Visible := kind <> rWebPage;
end;

procedure TfResource.bApplyClick(Sender: TObject);
var authorId, publicationId, tId : integer; filetype, dest : string;
begin
  if validate then
  begin
    with fMain do
    begin
      myQuery.SQL.Text := 'SELECT ID FROM authors WHERE Title = "'+ fMain.correctString(cbAuthor.Text) +'"';
      myQuery.Open;
      if myQuery.RecordCount > 0 then authorId := myQuery.Fields[0].AsInteger
      else
      begin
        executeCommand('INSERT INTO authors (Title) VALUES ("'+ fMain.correctString(cbAuthor.Text) +'")');
        authorId := myCommand.InsertId;
      end;

      myQuery.SQL.Text := 'SELECT ID FROM publications WHERE Title = "'+ fMain.correctString(cbPublication.Text) +'"';
      myQuery.Open;
      if myQuery.RecordCount > 0 then publicationId := myQuery.Fields[0].AsInteger
      else
      begin
        executeCommand('INSERT INTO publications (Title) VALUES ("'+ fMain.correctString(cbPublication.Text) +'")');
        publicationId := myCommand.InsertId;
      end;
    end;

    tId := fMain.InsertOrUpdate('resources', 'ID = '+ IntToStr(resourceId),
                                ['CreatorID', 'AuthorID', 'PublicationID', 'Kind', 'Content', 'Link', 'Title', 'AgeClass'],
                                [creatorId, authorId, publicationId, ResourceToString(kind), fMain.correctString(mContent.Lines.Text), eLink.Text, fMain.correctString(eTitle.Text), cbAgeClass.ItemIndex]);
    if tId <> -1 then resourceId := tId;

    if (kind = rAudio) or (kind = rVideo) then
    begin
      filetype := ExtractFileExt(eFile.Text);
      dest := fMain.resourceAddress + IntToStr(resourceId) + filetype;
      if eFile.Text <> dest then
        CopyFile(PWideChar(eFile.Text), PWideChar(dest), LongBool(0));
      fMain.executeCommand('UPDATE resources SET FileType = "'+ Copy(filetype, 2, Length(filetype)-1) +'" WHERE ID = '+ IntToStr(resourceId));
    end else
    begin
      fMain.myQuery.SQL.Text := 'SELECT FileType FROM resources WHERE ID = '+ IntToStr(resourceId);
      fMain.myQuery.Open;
      if fMain.myQuery.Fields[0].AsString <> '' then
      begin
        DeleteFile(fMain.resourceAddress + IntToStr(resourceId) + '.' + fMain.myQuery.Fields[0].AsString);
        fMain.executeCommand('UPDATE resources SET FileType = NULL WHERE ID = '+ IntToStr(resourceId));
      end;
    end;

    refresh;
  end;
end;

end.
