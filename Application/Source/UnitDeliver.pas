unit UnitDeliver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvOfficeButtons, AdvGlowButton, ExtCtrls, AdvPanel, Grids, BaseGrid,
  AdvGrid, AdvCGrid, AdvAppStyler, StdCtrls, AdvGroupBox, UnitMaster;

type
  TfDeliver = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gbAll: TAdvGroupBox;
    gDeliver: TAdvColumnGrid;
    AdvPanel2: TAdvPanel;
    bPreview: TAdvGlowButton;
    chPrint: TAdvOfficeCheckBox;
    bApply: TAdvGlowButton;

    procedure selectFrame();
    procedure deselectFrame();
    procedure bApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDeliver: TfDeliver;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfDeliver.selectFrame();
begin
  with fMain do
  begin
    executeCommand('CALL prepareUserMatchScores('+ fMain.selectedUserId +')');
    fillGridWithQuery(gDeliver, 'SELECT matches.ID, matches.Title, MAX(userMatchScores.UserScore) AS Score FROM userMatchScores INNER JOIN matches ON userMatchScores.MatchID = matches.ID WHERE matches.ID NOT IN (SELECT MatchID FROM answers WHERE UserID = '+ fMain.selectedUserId +') GROUP BY matches.ID, matches.Title ORDER BY UserScore DESC');
    executeCommand('DROP TEMPORARY TABLE userMatchScores');
  end;

  gbAll.Enabled := true;
  gDeliver.SetFocus;
end;
procedure TfDeliver.deselectFrame();
begin
  gbAll.Enabled := false;
  fMain.clearGrid(gDeliver);
end;

// GUI
procedure TfDeliver.bApplyClick(Sender: TObject);
begin
  fMain.InsertOrUpdate('answers', 'ID = -1', ['UserID', 'MatchID', 'DeliverTime'], [StrToInt(fMain.selectedUserId), StrToInt(gDeliver.Cells[0, gDeliver.Row]), Now] );
  fMain.bRefreshClick(nil);
end;

end.
