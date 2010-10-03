unit UnitResumeTahvil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, ExtCtrls,
  Buttons, Mask, Spin, AdvGlowButton, AdvPanel, AdvSpin, AdvGroupBox,
  AdvAppStyler, AdvOfficeButtons, AdvCGrid, UnitMaster;

type
  TfFreeScore = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gbAll: TAdvGroupBox;
    AdvPanel1: TAdvPanel;
    AdvGroupBox1: TAdvGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    SpinEdit1: TAdvSpinEdit;
    Edit1: TEdit;
    MaskEdit2: TMaskEdit;
    BitBtn4: TAdvGlowButton;
    CB_Kind: TComboBox;
    AdvPanel2: TAdvPanel;
    BitBtn1: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    gFreeScore: TAdvColumnGrid;
    procedure FillGrid();
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CB_KindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gFreeScoreEditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure selectFrame();
    procedure deselectFrame();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFreeScore: TfFreeScore;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfFreeScore.selectFrame();
begin
  gbAll.Enabled := true;
  FillGrid;
  if MaskEdit2.Visible = true then MaskEdit2.SetFocus else Edit1.SetFocus;
end;

procedure TfFreeScore.deselectFrame();
begin
  gbAll.Enabled := false;

  gFreeScore.RowCount := 2;
  gFreeScore.ClearRows(1,1);

  Edit1.Text := '';
  MaskEdit2.Text := '';
  SpinEdit1.Value := 0;
  BitBtn1.Down := false;
end;

procedure TfFreeScore.MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if Key = 13 then
 begin
    fMain.qTmpLibrary.SQL.Text:='SELECT Objects.[Object Name] FROM Objects WHERE (((Objects.[Object ID])="'+MaskEdit2.Text+'"));';
    fMain.qTmpLibrary.Open;
    if fMain.qTmpLibrary.RecordCount <> 0 then
     begin
        Edit1.Text:=fMain.qTmpLibrary.Fields[0].AsString;
        Edit1.SetFocus;
     end
    else
     begin
        fMain.MyShowMessage('.چنین كتابی وجود ندارد');
        MaskEdit2.SelectAll;
     end;
 end;
end;

procedure TfFreeScore.BitBtn4Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (SpinEdit1.Value = 0) then
  begin
    fMain.MyShowMessage('اطلاعات این مسابقه ناقص است');
    Abort;
  end;

  fMain.qTmp.SQL.Text := 'SELECT ID FROM FreeScores WHERE Title = "'+ fMain.correctString(Edit1.Text) +'" AND UserID = '+ fMain.selectedUserId;
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount = 0 then
  begin
    fMain.executeCommand('INSERT INTO FreeScores (UserID, GroupID, Title, Score, ScoreDate, OperatorID) '+
                          'VALUES ('+ fMain.selectedUserId +', '+ IntToStr(1 + CB_Kind.ItemIndex) +', "'+ fMain.correctString(Edit1.Text) +'", '+ SpinEdit1.Text +', "'+ fMain.getShamsiDate +'", '+ fMain.loginUserID +')');
    FillGrid;

    if MaskEdit2.Visible = true then MaskEdit2.SetFocus else Edit1.SetFocus;
  end else
  begin
    if MaskEdit2.Visible = true then MaskEdit2.SetFocus else Edit1.SetFocus;
    fMain.MyShowMessage('مسابقه با این نام قبلا برای شما ثبت شده است');
  end;
end;

procedure TfFreeScore.FillGrid();
var
  i : integer;
begin
  fMain.qTmp.SQL.Text := 'SELECT FreeScores.*, Caption FROM FreeScores LEFT JOIN Groups ON FreeScores.GroupID = Groups.ID ' +
                          'WHERE Groups.Kind = 0 AND UserID = '+ fMain.selectedUserId +' AND ScoreDate >= "'+ fMain.options.Values['BeginDate'] +'" ORDER BY FreeScores.ID DESC';
  fMain.qTmp.Open;

  gFreeScore.RowCount := 2;
  gFreeScore.ClearRows(1,1);
  for i := 1 to fMain.qTmp.RecordCount do
  begin
    gFreeScore.AddRow;
    gFreeScore.Cells[0,i] := fMain.qTmp.FieldByName('ID').AsString;
    gFreeScore.Cells[1,i] := fMain.qTmp.FieldByName('Title').AsString;
    gFreeScore.Cells[2,i] := fMain.qTmp.FieldByName('Caption').AsString;
    gFreeScore.Cells[3,i] := fMain.qTmp.FieldByName('Score').AsString;
    gFreeScore.Cells[4,i] := fMain.qTmp.FieldByName('ScoreDate').AsString;
    fMain.qTmp.Next;
  end;
  if fMain.qTmp.RecordCount > 0 then gFreeScore.RemoveRows(fMain.qTmp.RecordCount+1,1);

  gFreeScore.Options := gFreeScore.Options - [goEditing];
  for i := 0 to gFreeScore.ColCount-1 do gFreeScore.Columns[ i ].ReadOnly := True;
  BitBtn1.Down := False;
end;

procedure TfFreeScore.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to gFreeScore.ColCount-1 do gFreeScore.Columns[ i ].ReadOnly := True;
  gFreeScore.Options := gFreeScore.Options - [goEditing];
end;

procedure TfFreeScore.gFreeScoreEditingDone(Sender: TObject);
begin
  fMain.qTmp.SQL.Text := 'SELECT ID FROM Groups WHERE Kind = 0 AND Caption = "'+ gFreeScore.Cells[2,gFreeScore.Row] +'"';
  fMain.qTmp.Open;
  try
    fMain.executeCommand('UPDATE FreeScores SET Title = "'+ fMain.correctString(gFreeScore.Cells[1,gFreeScore.Row]) +'", GroupID = '+ fMain.qTmp.FieldByName('ID').AsString +', Score = '+ gFreeScore.Cells[3,gFreeScore.Row] +', ScoreDate = "'+ fMain.getShamsiDate +'" WHERE ID = '+ gFreeScore.Cells[0,gFreeScore.Row]);
  except end;
end;

procedure TfFreeScore.CB_KindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then SpinEdit1.SetFocus;
end;

procedure TfFreeScore.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CB_Kind.SetFocus;
end;

procedure TfFreeScore.SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TfFreeScore.AdvGlowButton1Click(Sender: TObject);
begin
  fMain.executeCommand('DELETE FROM FreeScores WHERE ID = '+ gFreeScore.Cells[0,gFreeScore.Row]);
  FillGrid;
end;

procedure TfFreeScore.BitBtn1Click(Sender: TObject);
var
  i : integer;
begin
  if BitBtn1.Down then
  begin
    gFreeScore.Options := gFreeScore.Options + [goEditing];
    for i := 0 to gFreeScore.ColCount-1 do gFreeScore.Columns[ i ].ReadOnly := False;
    gFreeScore.Columns[ 0 ].ReadOnly := True;
    gFreeScore.Columns[ 4 ].ReadOnly := True;
  end else
  begin
    gFreeScore.Options := gFreeScore.Options - [goEditing];
    for i := 0 to gFreeScore.ColCount-1 do gFreeScore.Columns[ i ].ReadOnly := True;
  end;
end;

end.
