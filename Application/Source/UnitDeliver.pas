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
  fMain.fillGridWithQuery(gDeliver, 'SELECT ID, Title FROM matches INNER JOIN supports ON matches.ID = supports.MatchID WHERE supports.TournamentID = 1 AND matches.ID NOT IN (SELECT MatchID FROM answers WHERE UserID = '+ fMain.selectedUserId +')');
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
  deselectFrame;
end;

end.
