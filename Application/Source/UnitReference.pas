unit UnitReference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvAppStyler, StdCtrls, ComCtrls, AdvGroupBox,
  AdvGlowButton, AdvEdit, UnitMaster, UnitTypes, StrUtils, clisted, Mask,
  AdvSpin;

type
  TfResource = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvPanel1: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    gMultiMedia: TAdvGroupBox;
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
    Label5: TLabel;
    gBook: TAdvGroupBox;
    Label7: TLabel;
    sPages: TAdvSpinEdit;
    Label9: TLabel;
    sDuration: TAdvSpinEdit;
    Label8: TLabel;
    cbAuthor: TComboBox;
    cbPublication: TComboBox;
    Label11: TLabel;

    procedure refresh();
    function validate() : boolean;
    procedure loadData(id : integer);

    procedure cbKindChange(Sender: TObject);
    procedure eFileRightButtonClick(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    kind : TResourceContent; resourceId, creatorId, entityId : integer;
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
  cbKindChange(nil);
  resourceId := -1;
  creatorId := StrToInt(fMain.loginUserID);

  sPages.Value := 0;

  eFile.Text := '';
  sDuration.Value := 0;

  eLink.Text := '';
  mContent.Text := '';
  cbKind.SetFocus;
end;
function TfResource.validate() : boolean;
begin
  Result := (eTitle.Text <> '');
{
  Result := Result and (cbAuthor.Text <> '');
  Result := Result and (cbPublication.Text <> '');
}
  case kind of
    rBook:
    begin
      Result := Result and (sPages.Value <> 0);
    end;

    rMultiMedia:
    begin
      Result := Result and (sDuration.Value <> 0);
      Result := Result and (FileExists(eFile.Text));
    end;

    rWebPage:
    begin
      Result := Result and (mContent.Text <> '');
      Result := Result and (eLink.Text <> '');
    end;
  end;

  if not Result then fMain.MyShowMessage('مقادیر وارد شده معتبر نیستند');
end;
procedure TfResource.loadData(id : integer);
var k : string;
begin
  refresh;
  resourceId := id;
  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT resources.Title AS Resource, authors.Title AS Author, publications.Title AS Publiation, resources.Kind, resources.AgeClass, resources.CreatorID, resources.EntityID FROM '+
                '((resources LEFT JOIN authors ON resources.AuthorID = authors.ID) LEFT JOIN publications ON resources.PublicationID = publications.ID) WHERE resources.ID = '+ IntToStr(resourceId);
    Open;

    cbKind.ItemIndex := Ord(StringToResource(FieldByName('Kind').AsString));
    cbAuthor.Text := FieldByName('Author').AsString;
    cbPublication.Text := FieldByName('Publiation').AsString;
    eTitle.Text := FieldByName('Resource').AsString;
    cbAgeClass.ItemIndex := FieldByName('AgeClass').AsInteger;
    creatorId := FieldByName('CreatorID').AsInteger;
    entityId := FieldByName('EntityID').AsInteger;

    k := FieldByName('Kind').AsString;
    SQL.Text := 'SELECT * FROM '+ k +'s WHERE ID = '+ IntToStr(entityId);
    Open;
    case StringToResource(k) of
      rBook:
      begin
        sPages.Value := FieldByName('Pages').AsInteger;
      end;

      rMultiMedia:
      begin
        sDuration.Value := FieldByName('Duration').AsInteger;
        eFile.Text := fMain.resourceAddress + IntToStr(resourceId) + '.' + FieldByName('FileType').AsString;
      end;

      rWebPage:
      begin
        mContent.Text := FieldByName('Content').AsString;
        eLink.Text := FieldByName('Link').AsString;
      end;
    end;

    cbKindChange(nil);
  end;
end;

// GUI
procedure TfResource.eFileRightButtonClick(Sender: TObject);
begin
  odMultiMeida.FileName := eFile.Text;
  if odMultiMeida.Execute then eFile.Text := odMultiMeida.FileName;
end;
procedure TfResource.FormCreate(Sender: TObject);
var rc : TResourceContent;
begin
  cbKind.Items.Clear;
  for rc := rBook to rMultiMedia do
    cbKind.Items.Add(ResourceToPersian(rc));
end;

procedure TfResource.cbKindChange(Sender: TObject);
begin
  kind := TResourceContent(cbKind.ItemIndex);
  gWebPage.Visible := kind = rWebPage;
  gBook.Visible := kind = rBook;
  gMultiMedia.Visible := kind = rMultiMedia;
end;

procedure TfResource.bApplyClick(Sender: TObject);
var authorId, publicationId, tId : integer; filetype, dest : string;
begin
  if validate then
  begin
    with fMain do
    begin
      if cbAuthor.Text <> '' then
      begin
        myQuery.SQL.Text := 'SELECT ID FROM authors WHERE Title = "'+ fMain.correctString(cbAuthor.Text) +'"';
        myQuery.Open;
        if myQuery.RecordCount > 0 then authorId := myQuery.Fields[0].AsInteger
        else
        begin
          executeCommand('INSERT INTO authors (Title) VALUES ("'+ fMain.correctString(cbAuthor.Text) +'")');
          authorId := myCommand.InsertId;
        end;
      end else authorId := -1;
      if cbPublication.Text <> '' then
      begin
        myQuery.SQL.Text := 'SELECT ID FROM publications WHERE Title = "'+ fMain.correctString(cbPublication.Text) +'"';
        myQuery.Open;
        if myQuery.RecordCount > 0 then publicationId := myQuery.Fields[0].AsInteger
        else
        begin
          executeCommand('INSERT INTO publications (Title) VALUES ("'+ fMain.correctString(cbPublication.Text) +'")');
          publicationId := myCommand.InsertId;
        end;
      end else publicationId := -1;
    end;

    case kind of
      rBook:
      begin
        tId := fMain.InsertOrUpdate('books', 'ID = '+ IntToStr(entityId),
                                   ['Pages'],
                                   [sPages.Value]);
      end;

      rMultiMedia:
      begin
        filetype := ExtractFileExt(eFile.Text);
        dest := fMain.resourceAddress + IntToStr(resourceId) + filetype;
        if eFile.Text <> dest then
          CopyFile(PWideChar(eFile.Text), PWideChar(dest), LongBool(0));


        tId := fMain.InsertOrUpdate('multimedias', 'ID = '+ IntToStr(entityId),
                                   ['FileType', 'Duration'],
                                   [Copy(filetype, 2, Length(filetype)-1), sDuration.Value]);
      end;

      rWebPage:
      begin
        tId := fMain.InsertOrUpdate('webpages', 'ID = '+ IntToStr(entityId),
                                   ['Link', 'Content', 'Words'],
                                   [eLink.Text, fMain.correctString(mContent.Lines.Text), 0]);
      end;
    end;
    if tId <> -1 then entityId := tId;

    tId := fMain.InsertOrUpdate('resources', 'ID = '+ IntToStr(resourceId),
                               ['CreatorID', 'Kind', 'Title', 'AgeClass', 'EntityID'],
                               [creatorId, ResourceToString(kind), fMain.correctString(eTitle.Text), cbAgeClass.ItemIndex, entityId]);
    if tId <> -1 then resourceId := tId;

    if authorId <> -1 then fMain.executeCommand('UPDATE resources SET AuthorID = '+ IntToStr(authorId) +' WHERE ID = '+ IntToStr(resourceId));
    if publicationId <> -1 then fMain.executeCommand('UPDATE resources SET PublicationID = '+ IntToStr(publicationId) +' WHERE ID = '+ IntToStr(resourceId));

    refresh;
  end;
end;

end.
