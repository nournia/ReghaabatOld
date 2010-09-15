unit UnitDesignBC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, Buttons,
  Spin, Mask, ExtCtrls, AdvSpin, AdvGroupBox, AdvPanel, AdvGlowButton,
  AdvAppStyler, UnitMaster, clisted;

type
  TfDesignBC = class(TMaster)
    P_MatchEdit: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    Label7: TLabel;
    Label1: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label3: TLabel;
    P_Action: TAdvPanel;
    BitBtn3: TAdvGlowButton;
    BitBtn1: TAdvGlowButton;
    BitBtn4: TAdvGlowButton;
    fs: TAdvFormStyler;
    MaskEdit2: TMaskEdit;
    ps: TAdvPanelStyler;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    Label14: TLabel;
    SpinEdit2: TAdvSpinEdit;
    SpinEdit1: TAdvSpinEdit;
    SpinEdit4: TAdvSpinEdit;
    clTags: TCheckListEdit;
    Grid: TAdvColumnGrid;
    pEditor: TAdvGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    mQuestion: TEdit;
    mAnswer: TMemo;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridResize(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEditingDone(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure mQuestionChange(Sender: TObject);
    procedure mAnswerChange(Sender: TObject);
    procedure GridSelectionChanged(Sender: TObject; ALeft, ATop, ARight, ABottom: Integer);
    procedure mQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure AddBCMatch(Code : string);
    procedure FormCreate(Sender: TObject);
    procedure clTagsClickBtn(Sender: TObject);
  private
    { Private declarations }
  public
    CreateMode, bookMode, own : Boolean;
    genuineID : String;
  end;

var
  fDesignBC: TfDesignBC;

implementation

uses UnitMain, UnitTDE;

{$R *.dfm}

procedure TfDesignBC.AddBCMatch(Code : string);
var
  i, q : Integer;
  BookCode : String;
  S, designer : String;
begin
  if bookMode then S := '1' else S := '4';
  if MaskEdit1.Text = '   -   ' then BookCode := '' else BookCode := MaskEdit1.Text;
  if MaskEdit2.Text = '    ' then designer := 'NULL' else designer := MaskEdit2.Text;

  fMain.executeCommand('INSERT INTO Matches (ID, DesignerID, Title, MaxScore, Age, State, QPPaper, LibraryBookID, Tags, Author, Publication, GenuineID) '+
  'VALUES ('+ Code +', '+ designer +', "'+ fMain.correctString(Edit5.Text) +'", '+ SpinEdit1.Text +', '+ SpinEdit4.Text +', '+ IntToStr(ComboBox2.ItemIndex) +', '+ SpinEdit2.Text +', "'+ BookCode +'", "'+ clTags.Text +'", "'+ fMain.correctString(Edit1.Text) +'", "'+ fMain.correctString(Edit2.Text) +'", '+ genuineID +')');

  q := 1;
  for i := 1 to Grid.RowCount-1 do
  if Grid.Cells[1,i] <> '' then
  begin
     fMain.executeCommand('INSERT INTO Questions (MatchID, ID, Question, Answer) VALUES ('+ Code +', '+ IntToStr(q) +',"'+ fMain.correctString(Grid.Cells[1,i]) +'", "'+ fMain.correctString(Grid.Cells[2,i]) +'")');
     inc(q);
  end;
end;

procedure TfDesignBC.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then Edit2.SetFocus;
end;

procedure TfDesignBC.Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then Grid.SetFocus;
end;

procedure TfDesignBC.Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then Edit1.SetFocus;
end;

procedure TfDesignBC.FormCreate(Sender: TObject);
begin
  ComboBox2.Items.Clear;
  ComboBox2.Items.Add(fMain.cStates[0]);
  ComboBox2.Items.Add(fMain.cStates[1]);
  ComboBox2.Items.Add(fMain.cStates[2]);
  ComboBox2.ItemIndex := 0;
  clTags.DropWidth := clTags.Width;
end;

procedure TfDesignBC.GridEditingDone(Sender: TObject);
begin
  mQuestion.Text := Grid.Cells[1,Grid.Row];
  mAnswer.Text := Grid.Cells[2,Grid.Row];

  if Grid.Col = 1 then Grid.Col := 2 else
  if Grid.Col = 2 then
  begin
    Grid.Col := 1;
    if Grid.Row < Grid.RowCount-1 then Grid.Row := Grid.Row + 1;
  end;
end;

procedure TfDesignBC.GridResize(Sender: TObject);
begin
  Grid.Columns[1].Width := Round( ( Grid.Width - Grid.Columns[0].Width )/2 ) - 11;
  Grid.Columns[2].Width := Grid.Columns[1].Width;
end;

procedure TfDesignBC.GridSelectionChanged(Sender: TObject; ALeft, ATop, ARight, ABottom: Integer);
begin
  mQuestion.Text := Grid.Cells[1,Grid.Row];
  mAnswer.Text := Grid.Cells[2,Grid.Row];
end;

procedure TfDesignBC.mAnswerChange(Sender: TObject);
begin
  Grid.Cells[2,Grid.Row] := mAnswer.Text;

  if Grid.Cells[1, Grid.RowCount-1] <> '' then
  begin
    Grid.AddRow;
    Grid.Cells[0, Grid.RowCount-1] := IntToStr(Grid.RowCount-1);
  end;
end;

procedure TfDesignBC.AdvGlowButton1Click(Sender: TObject);
begin
  pEditor.Visible := not pEditor.Visible;
end;

procedure TfDesignBC.BitBtn1Click(Sender: TObject);
begin
  fMain.deleteMatch('310000');
  if Grid.RowCount-2 < SpinEdit2.Value then SpinEdit2.Value := Grid.RowCount - 2;
  AddBCMatch('310000');
  F_TDE.GetFastReport('0', '310000', 'Preview', False, True);
  fMain.deleteMatch('310000');
end;

procedure TfDesignBC.BitBtn3Click(Sender: TObject);
var
  i, j : Integer; matchID : string;
begin
  matchID := fMain.StrToMatchID(Label2.Caption);
  if Edit5.Text = '' then
  begin
    fMain.MyShowMessage('لطفا برای مسابقه یك عنوان مناسب انتخاب كنید');
    Abort;
  end;

  fMain.qTmp.SQL.Text:='SELECT ID FROM Matches WHERE Title = "'+ fMain.correctString(Edit5.Text) +'" AND ID <> '+ matchID;
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount > 0 then
  begin
    fMain.MyShowMessage('مسابقه ' + fMain.qTmp.FieldByName('ID').AsString + ' با عنوان این مسابقه قبلا ثبت شده است و دو مسابقه نمی توانند عنوان یکسان داشته باشند');
    Abort;
  end;

  if fMain.searchMatch(matchID) then fMain.deleteMatch(matchID);

  j := 0; for i := 1 to Grid.RowCount-1 do if Grid.Cells[1,i] <> '' then j := j+1;
  if j < SpinEdit2.Value then SpinEdit2.Value := j;

  AddBCMatch(matchID);

  BitBtn4.Click;
end;

procedure TfDesignBC.BitBtn4Click(Sender: TObject);
begin
  if fMain.ICLibrary.Visible = True then
  begin
    MaskEdit1.Visible := True;
    Label3.Visible := True;
  end;

  clTags.Text := '';
  SpinEdit1.Value:=0;
  SpinEdit2.Value:=4;
  SpinEdit4.Value:=12;
  Edit1.Text:='';
  Edit2.Text:='';
  Edit5.Text:='';
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  ComboBox2.ItemIndex := 0;
  mAnswer.Text := '';
  mQuestion.Text := '';
  Own := True;

  if bookMode then Label2.Caption := fMain.getNewMatchID(1) else Label2.Caption := fMain.getNewMatchID(4);

  Grid.RowCount := 2;
  Grid.ClearRows(1,1);
  Grid.Cells[0,1] := '1';
end;

procedure TfDesignBC.clTagsClickBtn(Sender: TObject);
begin
  clTags.DropWidth := clTags.Width;
end;

procedure TfDesignBC.ComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    if MaskEdit1.Visible = True then MaskEdit1.SetFocus
    else Edit5.SetFocus;
end;

procedure TfDesignBC.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if MaskEdit1.Text = '   -   ' then
    begin
      Edit5.SetFocus;
      Abort;
    end;

    fMain.qTmp.SQL.Text:='SELECT * FROM Matches WHERE LibraryBookID = "'+MaskEdit1.Text+'"';
    fMain.qTmp.Open;
    if (fMain.qTmp.RecordCount > 0) and (fMain.qTmp.FieldByName('ID').AsString <> fMain.StrToMatchID(Label2.Caption)) then
    begin
      fMain.MyShowMessage( 'این شئ قبلا با كد مسابقه ' + fMain.qTmp.FieldByName('ID').AsString + ' ثبت شده است' );
      fMain.MaskEdit4.Text := fMain.qTmp.FieldByName('ID').AsString;
    end;

    fMain.qTmpLibrary.SQL.Text:='SELECT Objects.* FROM Objects WHERE (((Objects.[Object ID])="'+MaskEdit1.Text+'"));';
    fMain.qTmpLibrary.Open;

    if fMain.qTmpLibrary.RecordCount > 0 then
     begin
        Edit5.Text := fMain.qTmpLibrary.FieldByName('Object Name').AsString;
        Edit1.Text := fMain.qTmpLibrary.FieldByName('Object Writer').AsString;
        Edit2.Text := fMain.qTmpLibrary.FieldByName('Object Publication').AsString;
        Edit5.SetFocus;
     end
    else
     begin
        fMain.MyShowMessage('چنین مسابقه‌ای وجود ندارد');
        MaskEdit1.SelectAll;
     end;
 end;
end;

procedure TfDesignBC.MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then SpinEdit2.SetFocus;
end;

procedure TfDesignBC.mQuestionChange(Sender: TObject);
begin
  Grid.Cells[1,Grid.Row] := mQuestion.Text;

  if Grid.Cells[1, Grid.RowCount-1] <> '' then
  begin
    Grid.AddRow;
    Grid.Cells[0, Grid.RowCount-1] := IntToStr(Grid.RowCount-1);
  end;
end;

procedure TfDesignBC.mQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then mAnswer.SetFocus;
end;

procedure TfDesignBC.SpinEdit1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TfDesignBC.SpinEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then SpinEdit4.SetFocus;
end;

procedure TfDesignBC.SpinEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

end.
