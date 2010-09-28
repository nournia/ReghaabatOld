unit UnitDesignWP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, ExtDlgs, Buttons, ExtCtrls, StdCtrls, Mask, Spin, DBCtrls,
  AdvSpin, AdvToolBtn, AdvGlowButton, AdvPanel, AdvGroupBox, AdvAppStyler, UnitMaster,
  jpeg, clisted;

type
  TfInstructionMatch = class(TMaster)
    P_Action: TAdvPanel;
    bApply: TAdvGlowButton;
    bPreview: TAdvGlowButton;
    P_MatchEdit: TAdvPanel;
    gProperties: TAdvGroupBox;
    eTitle: TEdit;
    Label6: TLabel;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    mContent: TMemo;
    Label1: TLabel;
    cbCategory: TComboBox;
    Label3: TLabel;
    cbAgeClass: TComboBox;
    AdvGroupBox1: TAdvGroupBox;
    gContent: TAdvGroupBox;
    AdvGroupBox2: TAdvGroupBox;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    sHeight: TAdvSpinEdit;
    sWidth: TAdvSpinEdit;
    sTop: TAdvSpinEdit;
    sLeft: TAdvSpinEdit;
    AdvGroupBox6: TAdvGroupBox;
    bLoad: TAdvGlowButton;
    bFit: TAdvGlowButton;
    bClear: TAdvGlowButton;
    bSave: TAdvGlowButton;
    AdvGroupBox3: TAdvGroupBox;
    AdvGroupBox4: TAdvGroupBox;
    iContent: TImage;

    procedure refresh();
    function validate() : boolean;
    procedure loadData(id : integer);
    procedure addInstructionMatch(id : integer);

    procedure bPreviewClick(Sender: TObject);
    procedure sLeftChange(Sender: TObject);
    procedure sTopChange(Sender: TObject);
    procedure sWidthChange(Sender: TObject);
    procedure sHeightChange(Sender: TObject);
    procedure iContentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure iContentMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure iContentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bClearClick(Sender: TObject);
    procedure bLoadClick(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure bFitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    designerId, matchId : integer;
    ImgX, ImgY : Integer;
    imgChange, SH : boolean;
  end;

var
  fInstructionMatch: TfInstructionMatch;

implementation

uses UnitMain, UnitTDE;

{$R *.dfm}

function getNextToken (Const S: string; Separator: char; var StartPos: integer): String;
var Index: integer;
begin
  Result := '';
  While (S[StartPos] = Separator) and (StartPos <= length(S)) do
    StartPos := StartPos + 1;
  if StartPos > length(S) then Exit;
  Index := StartPos;

  While (S[Index] <> Separator) and (Index <= length(S))do
    Index := Index + 1;
  Result := Copy(S, StartPos, Index - StartPos) ;
  StartPos := Index + 1;
end;

procedure TfInstructionMatch.refresh();
begin
  fMain.fillComboWithQuery(cbAgeClass, 'SELECT CONCAT(Title, " - ", Description) FROM ageclasses ORDER BY ID');
  fMain.fillComboWithQuery(cbCategory, 'SELECT Title FROM categories ORDER BY ID');
  eTitle.Text := '';
  cbAgeClass.ItemIndex := 0;
  cbCategory.ItemIndex := 0;
  designerId := StrToInt(fMain.loginUserID);
  mContent.Text := '';

  bFit.Down := False;
  if bFit.Down then bFit.ImageIndex := 24 else bFit.ImageIndex := 28;
  bClearClick(nil);

  matchId := -1;

  cbCategory.SetFocus;
end;
function TfInstructionMatch.validate() : boolean;
var i, j : integer;
begin
  Result := (eTitle.Text <> '');
  if not Result then
  begin
    fMain.MyShowMessage('لطفا برای مسابقه یك عنوان مناسب انتخاب كنید');
    exit;
  end;

  Result := Result and (not fMain.recordExists('SELECT matches.ID FROM matches INNER JOIN supports ON matches.ID = supports.MatchID WHERE supports.CurrentState = "active" AND matches.Title = "'+ fMain.correctString(eTitle.Text) +'" AND matches.ID <> '+ IntToStr(matchId)));
  if not Result then
  begin
    fMain.MyShowMessage('عنوان این مسابقه، قبلا برای مسابقه‌ی دیگری انتخاب شده است. در یک رقابت دو مسابقه با عنوان مشابه نمی‌توانند فعال باشند.');
    exit;
  end;
end;
procedure TfInstructionMatch.loadData(id : integer);
var tokpos : integer;
begin
  refresh;
  matchId := id;
  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT Title, AgeClass, Content, Configuration, DesignerID, CategoryID FROM matches WHERE ID = '+ IntToStr(matchId);
    Open;

    eTitle.Text := FieldByName('Title').AsString;
    cbAgeClass.ItemIndex := FieldByName('AgeClass').AsInteger;
    cbCategory.ItemIndex := FieldByName('CategoryID').AsInteger;
    mContent.Text := FieldByName('Content').AsString;
    designerId := FieldByName('DesignerID').AsInteger;

    tokpos := 1;
    sHeight.Text := getNextToken(FieldByName('Configuration').AsString, ' ', tokpos);
    sWidth.Text := getNextToken(FieldByName('Configuration').AsString, ' ', tokpos);
    sTop.Text := getNextToken(FieldByName('Configuration').AsString, ' ', tokpos);
    sLeft.Text := getNextToken(FieldByName('Configuration').AsString, ' ', tokpos);
  end;
  fMain.loadJpeg(IntToStr(matchId), 'match', iContent, fMain.myQuery);
end;
procedure TfInstructionMatch.addInstructionMatch(id : integer);
var i, q, tId : Integer; answer : string;
begin
  tId := fMain.InsertOrUpdate('matches', 'ID = '+ IntToStr(id), ['DesignerID', 'Title', 'AgeClass', 'CategoryID', 'Content', 'Configuration'], [designerId, fMain.correctString(eTitle.Text), cbAgeClass.ItemIndex, cbCategory.ItemIndex, fMain.correctString(mContent.Lines.Text), sHeight.Text +' '+ sWidth.Text +' '+ sTop.Text +' '+ sLeft.Text]);
  if tId <> -1 then id := tId;
  if imgChange then fMain.InsertOrUpdateJpeg(IntToStr(id), 'match', iContent);
end;

// GUI
procedure TfInstructionMatch.bPreviewClick(Sender: TObject);
var
  LLCode : String;
begin
{x
  fMain.deleteMatch('320000');
  AddWPMatch('320000');
  F_TDE.GetFastReport('0', '320000', 'Preview', False, True);
  fMain.deleteMatch('320000');
}
end;

procedure TfInstructionMatch.bApplyClick(Sender: TObject);
begin
  if validate then
  begin
    addInstructionMatch(matchId);
    refresh;
  end;
end;

procedure TfInstructionMatch.sHeightChange(Sender: TObject);
begin
  iContent.Height := Round(sHeight.FloatValue);
  if bFit.Down then
    sWidth.FloatValue := Round((iContent.Picture.Width / iContent.Picture.Height) * sHeight.FloatValue * 100) / 100;
end;

procedure TfInstructionMatch.sWidthChange(Sender: TObject);
begin
  iContent.Width := Round(sWidth.FloatValue );
  if bFit.Down then
    sHeight.FloatValue := Round((iContent.Picture.Height / iContent.Picture.Width) * sWidth.FloatValue * 100) / 100;
end;

procedure TfInstructionMatch.sTopChange(Sender: TObject);
begin
  iContent.Top := Round(sTop.FloatValue);
end;

procedure TfInstructionMatch.sLeftChange(Sender: TObject);
begin
  iContent.Left := Round(sLeft.FloatValue);
end;

procedure TfInstructionMatch.FormCreate(Sender: TObject);
begin
  iContent.Top := 0;
  iContent.Left := 0;
end;

procedure TfInstructionMatch.iContentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SH := True;
  ImgX := X;
  ImgY := Y;
end;

procedure TfInstructionMatch.iContentMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if SH = True then
  begin
    TImage( Sender ).Left := X + TImage( Sender ).Left - ImgX;
    TImage( Sender ).Top := Y + TImage( Sender ).Top - ImgY;
    sTop.FloatValue := iContent.Top;
    sLeft.FloatValue := iContent.Left;
  end;
end;

procedure TfInstructionMatch.iContentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SH := False;
end;

procedure TfInstructionMatch.bLoadClick(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      iContent.Picture.LoadFromFile(fMain.odJPEG.FileName);
      sHeight.FloatValue := Round(iContent.Picture.Height / 7.256 * 100) / 100;
      sWidth.FloatValue := Round(iContent.Picture.Width / 7.256 * 100) / 100;
      sTop.FloatValue := 0;
      sLeft.FloatValue := 0;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfInstructionMatch.bSaveClick(Sender: TObject);
begin
  if fMain.sdJPEG.Execute then
     iContent.Picture.SaveToFile(fMain.AddExtension(fMain.sdJPEG.FileName, '.jpg'));
end;

procedure TfInstructionMatch.bClearClick(Sender: TObject);
begin
  imgChange := true;
  sHeight.FloatValue := 0;
  sWidth.FloatValue := 0;
  sTop.FloatValue := 0;
  sLeft.FloatValue := 0;
  iContent.Picture := nil;
end;

procedure TfInstructionMatch.bFitClick(Sender: TObject);
begin
  if bFit.Down then bFit.ImageIndex := 24 else bFit.ImageIndex := 28;
end;

end.
