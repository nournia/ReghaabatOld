unit UnitSetScore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, Buttons, Mask,
  AdvAppStyler, AdvGlowButton, AdvPanel, ADODB, DB, UnitMaster, AdvGroupBox,
  AdvOfficeButtons;

type
  TfCorrect = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gbAll: TAdvGroupBox;
    pUserId: TAdvPanel;
    rgUserId: TAdvOfficeRadioGroup;
    AdvPanel2: TAdvPanel;
    bApply: TAdvGlowButton;
    gCorrect: TAdvColumnGrid;
    bRemove: TAdvGlowButton;
    procedure bApplyClick(Sender: TObject);
    procedure rgUserIdClick(Sender: TObject);
    procedure selectFrame();
    procedure deselectFrame();
    procedure gCorrectEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure gCorrectGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure bRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCorrect: TfCorrect;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfCorrect.selectFrame();
var tmp : string;
begin
  case rgUserId.ItemIndex of
    0 : tmp := ' AND matches.DesignerID = '+ fMain.selectedUserId;
    1 : tmp := ' AND answers.UserID = '+ fMain.selectedUserId;
  end;

  fMain.fillGridWithQuery(gCorrect, 'SELECT UserID, MatchID, users.LastName, matches.Title FROM answers INNER JOIN users ON answers.UserID = users.ID INNER JOIN matches ON answers.MatchID = matches.ID WHERE ReceiveTime IS NOT NULL AND DeliverTime IS NOT NULL AND CorrectTime IS NULL '+ tmp);
  gbAll.Enabled := true;
  gCorrect.SetFocus;
end;
procedure TfCorrect.bRemoveClick(Sender: TObject);
begin
  fMain.executeCommand('DELETE FROM answers WHERE UserID = '+ gCorrect.Cells[0, gCorrect.Row] +' AND MatchID = '+ gCorrect.Cells[1, gCorrect.Row]);
  gCorrect.RemoveRows(gCorrect.Row, 1);
end;

procedure TfCorrect.deselectFrame();
begin
  gbAll.Enabled := false;
  fMain.clearGrid(gCorrect);
end;

procedure TfCorrect.bApplyClick(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to gCorrect.RowCount do
    if gCorrect.Cells[1,i] <> '' then
      fMain.executeCommand('UPDATE answers SET CorrectTime = NOW(), Rate = '+ gCorrect.Cells[4,i] +' WHERE UserID = '+ gCorrect.Cells[0,i] +' AND MatchID = '+ gCorrect.Cells[1,i]);
  fMain.bRefreshClick(nil);
end;

procedure TfCorrect.gCorrectEditCellDone(Sender: TObject; ACol, ARow: Integer);
begin
  if gCorrect.Cells[ACol, ARow] <> '' then
  if (StrToFloat(gCorrect.Cells[ACol, ARow]) < 0) or (StrToFloat(gCorrect.Cells[ACol, ARow]) > 2) then
    gCorrect.Cells[ACol, ARow] := '';
end;

procedure TfCorrect.gCorrectGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if (ARow > 0) and (gCorrect.Cells[4, ARow] <> '') then
    ABrush.Color := $0080FFFF;
end;

procedure TfCorrect.rgUserIdClick(Sender: TObject);
begin
  selectFrame;
end;

end.
