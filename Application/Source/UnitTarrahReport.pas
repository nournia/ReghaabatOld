unit UnitTarrahReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Spin,
  Buttons, ExtCtrls, Mask, AdvSpin, AdvGlowButton, AdvPanel, AdvAppStyler,
  AdvCGrid, AdvGroupBox, asgprev, UnitMaster, MemDS, DBAccess, MyAccess;

type
  TfDesigner = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    PreviewGrid: TAdvPreviewDialog;
    gbAll: TAdvGroupBox;
    AdvPanel2: TAdvPanel;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    gDesigner: TAdvColumnGrid;
    SpinEdit2: TAdvSpinEdit;
    Label4: TLabel;
    SpinEdit1: TAdvSpinEdit;
    Label2: TLabel;
    qDesigner: TMyQuery;
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);

    procedure selectFrame();
    procedure deselectFrame();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDesigner: TfDesigner;

implementation

uses UnitTDE, UnitMain, UnitExImport;

{$R *.dfm}

procedure TfDesigner.selectFrame();
var i : integer;
begin
  gbAll.Enabled := true;

  qDesigner.SQL.Text := 'SELECT ID, Title, LibraryBookID, State, CountOfQuestion, CountOfAnswer, IIf(State=0, "'+ fMain.cStates[0] +'", IIf(State=1, "'+ fMain.cStates[1]+ '", IIf(State=2,"'+ fMain.cStates[2] +'", ""))) AS tState '+
                        'FROM Matches INNER JOIN (SELECT MatchID, Count(Question) AS CountOfQuestion, Count(Answer) AS CountOfAnswer FROM Questions GROUP BY MatchID) AS qs ON Matches.ID = qs.MatchID WHERE DesignerID = '+ fMain.userID +' ORDER BY ID';
  qDesigner.Open;

  for i := 1 to qDesigner.RecordCount do
  begin
    gDesigner.AddRow;
    gDesigner.Cells[6,i] := IntToStr(i);
    gDesigner.Cells[5,i] := qDesigner.FieldByName('ID').AsString;
    gDesigner.Cells[4,i] := qDesigner.FieldByName('Title').AsString;
    gDesigner.Cells[3,i] := qDesigner.FieldByName('LibraryBookID').AsString;
    gDesigner.Cells[2,i] := qDesigner.FieldByName('CountOfQuestion').AsString;
    gDesigner.Cells[1,i] := qDesigner.FieldByName('CountOfAnswer').AsString;
    gDesigner.Cells[0,i] := qDesigner.FieldByName('tState').AsString;
    qDesigner.Next;
  end;
  if qDesigner.RecordCount > 0 then gDesigner.RemoveRows(qDesigner.RecordCount+1,1);

  gDesigner.Col := 2;
  gDesigner.SetFocus;

  SpinEdit2.MaxValue := qDesigner.RecordCount;
  SpinEdit1.MaxValue := SpinEdit2.MaxValue;
  SpinEdit2.Value := qDesigner.RecordCount;
  SpinEdit1.Value := 1;
end;

procedure TfDesigner.deselectFrame();
begin
  gbAll.Enabled := false;

  gDesigner.RowCount := 2;
  gDesigner.ClearRows(1,1);
  qDesigner.Close;
end;

procedure TfDesigner.AdvGlowButton1Click(Sender: TObject);
var
  i : integer; x : boolean;
begin
  for i := SpinEdit1.Value to SpinEdit2.Value do
  begin
    if i = SpinEdit1.Value then x := true else x := false;
    qDesigner.RecNo := i;
    try
      F_TDE.GetFastReport(fMain.userID, qDesigner.FieldByName('ID').AsString, 'Prepare', False, x);
    except on E: Exception do
    end;
  end;
  fMain.frxReport.ShowPreparedReport;
end;

procedure TfDesigner.AdvGlowButton3Click(Sender: TObject);
begin
  gDesigner.PrintSettings.RowSpacing := -20;
  gDesigner.PrintSettings.TitleText := 'لیست مسابقات طراحی شده توسط ' + fMain.LName.Caption + ' ' + fMain.LFamily.Caption;
  PreviewGrid.Execute;
end;

procedure TfDesigner.FormCreate(Sender: TObject);
begin
  gDesigner.FixedCols := 0;
  gDesigner.Options := gDesigner.Options + [goRowSelect];
end;

end.
