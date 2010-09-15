unit UnitSetScore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, Buttons, Mask,
  AdvAppStyler, AdvGlowButton, AdvPanel, ADODB, DB, UnitMaster, AdvGroupBox,
  AdvOfficeButtons;

type
  TfSetScore = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gbAll: TAdvGroupBox;
    P_SetScore: TAdvPanel;
    RG_TS: TAdvOfficeRadioGroup;
    P_Position: TAdvPanel;
    Label3: TLabel;
    Label4: TLabel;
    L_Position: TLabel;
    BitBtn4: TAdvGlowButton;
    ME_Position: TMaskEdit;
    gSetScore: TAdvColumnGrid;
    pHint: TAdvPanel;
    Label1: TLabel;
    AdvPanel2: TAdvPanel;
    BitBtn3: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure gSetScoreRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure gSetScoreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gSetScoreGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure gSetScoreEditingDone(Sender: TObject);
    procedure ME_PositionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ME_PositionChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RG_TSClick(Sender: TObject);
    procedure selectFrame();
    procedure deselectFrame();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSetScore: TfSetScore;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfSetScore.selectFrame();
begin
  gbAll.Enabled := true;
  RG_TSClick(nil);
end;

procedure TfSetScore.deselectFrame();
begin
  gbAll.Enabled := false;

  L_Position.Caption := '';
  gSetScore.RowCount := 2;
  gSetScore.ClearRows(1,1);
  BitBtn4.Enabled := False;
end;

procedure TfSetScore.AdvGlowButton1Click(Sender: TObject);
begin
  gSetScore.Cells[ 1, gSetScore.Row ] := '';
  gSetScore.RepaintRow(gSetScore.Row);
end;

procedure TfSetScore.AdvGlowButton2Click(Sender: TObject);
begin
  gSetScore.SearchFooter.Visible := not gSetScore.SearchFooter.Visible;
end;

procedure TfSetScore.BitBtn3Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to gSetScore.RowCount do
    if gSetScore.Cells[1,i] <> '' then
      fMain.executeCommand('UPDATE Transactions SET ScoreDate = "'+ fMain.getShamsiDate +'", Score = '+ gSetScore.Cells[1,i] +', OperatorID = '+ fMain.loginUserID +' WHERE UserID = '+ gSetScore.Cells[6,i] +' AND MatchID = '+ gSetScore.Cells[4,i]);
  fMain.B_Refresh.Click;
end;

procedure TfSetScore.BitBtn4Click(Sender: TObject);
var
  DRa, DBa, matchID : String;
begin
  DRa := ''; DBa := '';
  matchID := fMain.StrToMatchID(ME_Position.Text);

  fMain.qTmp.SQL.Text := 'SELECT * FROM Transactions WHERE UserID = '+ fMain.userID +' AND MatchID = '+ matchID;
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount > 0 then
  begin
    DRa := fMain.qTmp.FieldByName('DeliverDate').AsString;
    DBa := fMain.qTmp.FieldByName('ReceiveDate').AsString;
  end;
  if DRa = '' then DRa := fMain.getShamsiDate;
  if DBa = '' then DBa := fMain.getShamsiDate;

  fMain.executeCommand('DELETE FROM Transactions WHERE UserID = '+ fMain.userID +' AND MatchID = '+ matchID);
  fMain.executeCommand('INSERT INTO Transactions (UserID, MatchID, DeliverDate, ReceiveDate) VALUES ('+ fMain.userID +', '+ matchID +', "'+ DRa +'", "'+ DBa +'")');

  fMain.B_Refresh.Click;
end;

procedure TfSetScore.gSetScoreEditingDone(Sender: TObject);
begin
  if StrToInt(gSetScore.Cells[ 1, gSetScore.Row ]) > 2 * StrToInt(gSetScore.Cells[ 2, gSetScore.Row ]) then
    gSetScore.Cells[ 1, gSetScore.Row ] :=  IntToStr(2 * StrToInt(gSetScore.Cells[ 2, gSetScore.Row ]));
  if StrToInt( gSetScore.Cells[ 1, gSetScore.Row ] ) < -100 then gSetScore.Cells[ 1, gSetScore.Row ] := '-100';
  gSetScore.RepaintRow(gSetScore.Row);
  gSetScore.SetFocus;
end;

procedure TfSetScore.gSetScoreGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if (ARow > 0) and (gSetScore.Cells[1, ARow] <> '') then
    ABrush.Color := $0080FFFF;
end;

procedure TfSetScore.gSetScoreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 106 then BitBtn3.Click;
end;

procedure TfSetScore.gSetScoreRightClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  if ARow <> 0 then gSetScore.Cells[ 1, ARow ] := '';
  gSetScore.RepaintRow(ARow);
end;

procedure TfSetScore.ME_PositionChange(Sender: TObject);
begin
  BitBtn4.Enabled := False;
end;

procedure TfSetScore.ME_PositionKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  User, Code : String;
begin
  if key = 13 then
  begin
    if fMain.userID = '' then abort;

    ME_Position.SelectAll;

    Code := fMain.StrToMatchID(ME_Position.Text);
    User := fMain.userID;
    L_Position.Caption := '';

    fMain.qTmp.SQL.Text:='SELECT ID FROM Matches WHERE ID = '+ Code;
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount = 0 then
    begin
      L_Position.Caption := 'چنین مسابقه ای وجود ندارد.';
      Abort;
    end;

    fMain.qTmp.SQL.Text:='SELECT * FROM Transactions WHERE UserID = '+ User +' AND MatchID = '+ Code;
    fMain.qTmp.Open;

    if fMain.qTmp.RecordCount = 0 then
    begin
      L_Position.Caption := 'این عضو تا حالا این مسابقه را نبرده است.';
      BitBtn4.Enabled := True;
    end else if fMain.qTmp.FieldByName('DeliverDate').AsString = '' then
    begin
      L_Position.Caption := 'جزئیات اطلاعات مربوط به تحویل این مسابقه به این عضو پاک شده است.';
    end else if fMain.qTmp.FieldByName('ReceiveDate').AsString = '' then
    begin
      L_Position.Caption := 'این عضو این مسابقه را تحویل گرفته اما هنوز آن را تحویل نداده است.';
      BitBtn4.Enabled := True;
    end else if fMain.qTmp.FieldByName('ScoreDate').AsString = '' then
    begin
      L_Position.Caption := 'این مسابقه آماده برای امتیاز دادن است.';
      BitBtn4.Enabled := True;
    end else
    begin
      L_Position.Caption := 'امتیاز داده شده به این مسابقه : ' + fMain.qTmp.FieldByName('Score').AsString + ' - توسط : ' + fMain.qTmp.FieldByName('OperatorID').AsString;
      BitBtn4.Enabled := True;
    end;
  end;
end;

procedure TfSetScore.RG_TSClick(Sender: TObject);
var cond : string; i : integer;
begin
  gSetScore.RowCount := 2;
  gSetScore.ClearRows(1,1);

  if fMain.userID <> '' then
  begin
  if RG_TS.ItemIndex = 0 then cond := ' AND DesignerID = '+ fMain.userID else cond := ' AND UserID = '+ fMain.userID;
  fMain.qTmp.SQL.Text := 'SELECT UserID, LastName, MatchID, Title, MaxScore FROM Transactions, Matches, Users WHERE Transactions.UserID = Users.ID AND Transactions.MatchID = Matches.ID AND '+
                          'ReceiveDate Is Not Null AND DeliverDate Is Not Null AND ScoreDate Is Null AND ReceiveDate >= "'+ fMain.options.Values['BeginDate'] + '"' + cond;
  fMain.qTmp.Open;

  for i := 1 to fMain.qTmp.RecordCount do
  begin
    gSetScore.AddRow;
    gSetScore.Cells[6,i] := fMain.qTmp.FieldByName('UserID').AsString;
    gSetScore.Cells[5,i] := fMain.qTmp.FieldByName('LastName').AsString;
    gSetScore.Cells[4,i] := fMain.qTmp.FieldByName('MatchID').AsString;
    gSetScore.Cells[3,i] := fMain.qTmp.FieldByName('Title').AsString;
    gSetScore.Cells[2,i] := fMain.qTmp.FieldByName('MaxScore').AsString;
    gSetScore.AddCheckBox(0,i,false,false);
    fMain.qTmp.Next;
  end;
  if fMain.qTmp.RecordCount > 0 then gSetScore.RemoveRows(fMain.qTmp.RecordCount+1,1);

  gSetScore.Col := 2;
  gSetScore.SetFocus;
  end;

  if RG_TS.ItemIndex = 1 then
  begin
    P_Position.Visible := True;
    ME_Position.SetFocus;
  end else
  begin
    P_Position.Visible := False;
  end;
end;

end.
