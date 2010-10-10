unit UnitReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, ExtCtrls, AdvPanel, Grids, BaseGrid, AdvGrid,
  AdvCGrid, StdCtrls, AdvGroupBox, AdvAppStyler, UnitMaster;

type
  TfReceive = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gbAll: TAdvGroupBox;
    gReceive: TAdvColumnGrid;
    AdvPanel2: TAdvPanel;
    bApply: TAdvGlowButton;
    bRemove: TAdvGlowButton;

    procedure selectFrame();
    procedure deselectFrame();
    procedure bApplyClick(Sender: TObject);
    procedure bRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReceive: TfReceive;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfReceive.selectFrame();
begin
  fMain.selectedForm := fReceive;
  fMain.fillGridWithQuery(gReceive, 'SELECT ID, Title FROM matches INNER JOIN supports ON matches.ID = supports.MatchID WHERE supports.TournamentID = 1 AND matches.ID IN (SELECT MatchID FROM answers WHERE UserID = '+ fMain.selectedUserId +' AND DeliverTime IS NOT NULL AND ReceiveTime IS NULL)');
  gbAll.Enabled := true;
  gReceive.SetFocus;
end;
procedure TfReceive.deselectFrame();
begin
  gbAll.Enabled := false;
  fMain.clearGrid(gReceive);
end;

// GUI
procedure TfReceive.bRemoveClick(Sender: TObject);
begin
  fMain.executeCommand('DELETE FROM answers WHERE UserID = '+ fMain.selectedUserId + ' AND MatchID = '+ gReceive.Cells[0, gReceive.Row]);
  gReceive.RemoveRows(gReceive.Row, 1);
end;

procedure TfReceive.bApplyClick(Sender: TObject);
begin
  fMain.executeCommand('UPDATE answers SET ReceiveTime = NOW() WHERE UserID = '+ fMain.selectedUserId + ' AND MatchID = '+ gReceive.Cells[0, gReceive.Row]);
  fMain.bRefreshClick(nil);
end;
end.
