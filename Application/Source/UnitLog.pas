unit UnitLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, StdCtrls, Buttons, Mask, DB, ADODB, Grids, BaseGrid, StrUtils,
  AdvGrid, AdvCGrid, ExtCtrls, ComCtrls, Spin, AdvPanel, AdvGroupBox, AdvSpin,
  AdvGlowButton, AdvProgressBar, AdvAppStyler, AdvOfficeButtons, frxExportPDF, UnitMaster,
  DBAdvGrid, MemDS, DBAccess, MyAccess;

type
  TfLog = class(TMaster)
    fdLog: TfrxUserDataSet;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    frxLog: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    odLog: TOpenDialog;
    dsLog: TDataSource;
    AdvPanel1: TAdvPanel;
    P_Main: TAdvGroupBox;
    AdvGroupBox2: TAdvGroupBox;
    Label1: TLabel;
    meUserID: TMaskEdit;
    BitBtn2: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    AdvGroupBox5: TAdvGroupBox;
    rgLogFile: TAdvOfficeRadioGroup;
    eLogFile: TButtonedEdit;
    AdvGroupBox6: TAdvGroupBox;
    Label8: TLabel;
    E_Title: TEdit;
    AdvGroupBox4: TAdvGroupBox;
    gLog: TDBAdvGrid;
    AdvGroupBox7: TAdvGroupBox;
    CB_Match: TComboBox;
    Label7: TLabel;
    AdvGroupBox3: TAdvGroupBox;
    Label2: TLabel;
    BitBtn4: TAdvGlowButton;
    rgGender: TAdvOfficeRadioGroup;
    qAll: TMyQuery;
    qBook: TMyQuery;
    qWork: TMyQuery;
    qArt: TMyQuery;
    qMultiMedia: TMyQuery;
    qFreeScore: TMyQuery;
    qLog: TMyQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure meUserIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CB_MatchChange(Sender: TObject);
    procedure fdLogGetValue(const VarName: string; var Value: Variant);
    procedure getUsersLogReport(userCondition : String = '');
    procedure eLogFileRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    TopScore : array[0..5] of Integer;
    userChanged : Boolean;
    qry : array[0..5] of TMyQuery;
end;

var
  fLog: TfLog;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfLog.meUserIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then BitBtn2.Click;
end;

procedure TfLog.BitBtn2Click(Sender: TObject);
begin
  if meUserID.Text <> '    ' then
    GetUsersLogReport('Users.ID = ' + meUserID.Text);
end;

procedure TfLog.BitBtn4Click(Sender: TObject);
var str : string;
begin
  case rgGender.ItemIndex of
    0: str := '';
    1: str := 'Man = True';
    2: str := 'Man = False';
  end;
  GetUsersLogReport(str);
end;

procedure TfLog.eLogFileRightButtonClick(Sender: TObject);
begin
  if odLog.Execute then eLogFile.Text := odLog.FileName;
  rgLogFile.ItemIndex := 0;
end;

procedure TfLog.CB_MatchChange(Sender: TObject);
begin
  qlog.SQL.Text := 'SELECT * FROM '+ fMain.sqlUserScores('', CB_Match.ItemIndex) +' WHERE ScoreSum > 0 ORDER BY ScoreSum DESC';
  qlog.Open;
end;

procedure TfLog.FormCreate(Sender: TObject);
var
  i: integer;
begin
  qry[0] := qAll;
  qry[1] := qBook;
  qry[2] := qWork;
  qry[3] := qArt;
  qry[4] := qMultiMedia;
  qry[5] := qFreeScore;

  CB_Match.Clear;
  for i := 0 to 5 do CB_Match.AddItem(fMain.cMatches[i], CB_Match);
  CB_Match.ItemIndex := 0;
end;

procedure TfLog.getUsersLogReport(userCondition : String);
var i : Integer; str : string; MemoTemp : TfrxMemoView;
begin
  fMain.qfLibrary.Close;
  fMain.qfLibrary.Open;

  if userCondition <> '' then userCondition := 'AND '+ userCondition;
  qry[0].SQL.Text := 'SELECT Users.ID, FirstName, LastName, '+ LeftStr(fMain.getShamsiDate,4) +'-CInt(Left(BirthDate,4)) AS Age, ScoreSum, ScoreCount, AvgQuality FROM Users, '+ fMain.sqlUserScores('', 0) +' WHERE Users.ID = UserScores.ID '+ userCondition +' AND IsNumeric(Left(BirthDate,4)) AND ScoreSum > 0 ORDER BY ScoreSum DESC';
  qry[0].Open;
  TopScore[0] := qry[0].FieldByName('ScoreSum').AsInteger;
  for i := 1 to 5 do
  begin
    qry[i].SQL.Text := 'SELECT ID, ScoreSum, ScoreCount, AvgQuality FROM '+ fMain.sqlUserScores('', i) +' WHERE ScoreSum > 0 ORDER BY ScoreSum DESC';
    qry[i].Open;
    TopScore[i] := qry[i].FieldByName('ScoreSum').AsInteger;
  end;

  fdLog.First;
  fdLog.RangeEndCount := 6 * qry[0].RecordCount;
  userChanged := true;

  case rgLogFile.ItemIndex of
    0 : str := eLogFile.Text;
    1 : str := ExtractFileDir(Application.ExeName) + '\Reports\Log0.fr3';
    2 : str := ExtractFileDir(Application.ExeName) + '\Reports\Log1.fr3';
  end;

  if fdLog.RangeEndCount <> 0 then
  begin
    frxLog.LoadFromFile(str);
    MemoTemp := frxLog.FindObject('Memo17') as TfrxMemoView;
    MemoTemp.Text := E_Title.Text;
    frxLog.ShowReport;
  end;
end;

procedure TfLog.fdLogGetValue(const VarName: string; var Value: Variant);
var i, qryi : byte; j, userID : Integer;
begin
  if (fdLog.RecNo mod 6 <> 0) then userChanged := True;
  if (userChanged = True) and (fdLog.RecNo mod 6 = 0) then
  begin
    userChanged := False;
    if fdLog.RecNo <> 0 then qry[0].Next;
    userID := qry[0].Fields[0].AsInteger;
    for i := 1 to 5 do
    begin
      qry[i].RecNo := 1;
      for j := 1 to qry[i].RecordCount do
        if qry[i].Fields[0].AsInteger <> userID then qry[i].Next else break;
    end;
  end;

  qryi := (fdLog.RecNo + 1) mod 6;
  if VarName = 'Group' then Value := fMain.cMatches[qryi] else
  if VarName = 'TopScore' then Value := TopScore[qryi] else
  if VarName = 'Age' then Value := qry[0].FieldByName('Age').AsString else
  if VarName = 'Name' then Value := qry[0].FieldByName('FirstName').AsString + ' ' + qry[0].FieldByName('LastName').AsString else
  if VarName = 'ID' then Value := qry[0].FieldByName('ID').AsString else
  if qry[0].Fields[0].AsInteger = qry[qryi].Fields[0].AsInteger then
  begin
    if VarName = 'Grade' then Value := qry[qryi].RecNo else
    if VarName = 'Score' then Value := qry[qryi].FieldByName('ScoreSum').AsString else
    if VarName = 'Quality' then Value := qry[qryi].FieldByName('AvgQuality').AsString else
    if VarName = 'Count' then Value := qry[qryi].FieldByName('ScoreCount').AsString;
  end;
end;

end.
