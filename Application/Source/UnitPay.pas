unit UnitPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, StdCtrls, Mask, AdvSpin, AdvGroupBox, ExtCtrls,
  AdvPanel, AdvAppStyler;

type
  TfPay = class(TForm)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvPanel2: TAdvPanel;
    gbAll: TAdvGroupBox;
    S_GroupBox1: TAdvGroupBox;
    sScore: TAdvSpinEdit;
    bPay: TAdvGlowButton;
    Label6: TLabel;
    lScore: TLabel;
    Label1: TLabel;
    lPaid: TLabel;
    Label3: TLabel;
    lSum: TLabel;
    Label5: TLabel;

    procedure selectFrame();
    procedure deselectFrame();
    procedure sScoreChange(Sender: TObject);
    procedure bPayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPay: TfPay;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfPay.selectFrame();
begin
  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT Score FROM scores WHERE TournamentID = 1 AND UserID ='+ fMain.selectedUserId;
    Open;
    if Fields[0].AsVariant <> null then lScore.Caption := Fields[0].AsString;
    SQL.Text := 'SELECT SUM(Payment) FROM payments WHERE TournamentID = 1 AND UserID ='+ fMain.selectedUserId;
    Open;
    if Fields[0].AsVariant <> null then lPaid.Caption := Fields[0].AsString;
    lSum.Caption := IntToStr(StrToInt(lScore.Caption) - StrToInt(lPaid.Caption));
  end;

  fMain.selectedForm := fPay;
  gbAll.Enabled := true;
  sScore.SetFocus;
end;
procedure TfPay.deselectFrame();
begin
  gbAll.Enabled := false;
  lScore.Caption := '0';
  lPaid.Caption := '0';
  lSum.Caption := '0';
  sScore.Value := 0;
  bPay.Enabled := false;
end;

// GUI
procedure TfPay.sScoreChange(Sender: TObject);
begin
  bPay.Enabled := not ((sScore.Value = 0) or (StrToInt(lSum.Caption) - sScore.Value < -50));
end;

procedure TfPay.bPayClick(Sender: TObject);
begin
  fMain.InsertOrUpdate('payments', 'ID = -1', ['TournamentID', 'UserID', 'Payment', 'PayTime'], [1, fMain.selectedUserId, sScore.Value, Now]);
  deselectFrame;
  selectFrame;
end;
end.
