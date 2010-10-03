unit UnitDesignBC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, Buttons,
  Spin, Mask, ExtCtrls, AdvSpin, AdvGroupBox, AdvPanel, AdvGlowButton,
  AdvAppStyler, UnitMaster, clisted;

type
  TfQuestionMatch = class(TMaster)
    P_MatchEdit: TAdvPanel;
    gProperties: TAdvGroupBox;
    Label1: TLabel;
    eTitle: TEdit;
    P_Action: TAdvPanel;
    bApply: TAdvGlowButton;
    bPreview: TAdvGlowButton;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    bEditor: TAdvGlowButton;
    Grid: TAdvColumnGrid;
    pEditor: TAdvGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    mQuestion: TEdit;
    mAnswer: TMemo;
    Label3: TLabel;
    cbAgeClass: TComboBox;
    Label2: TLabel;
    cbState: TComboBox;
    meCorrectorId: TMaskEdit;
    Label5: TLabel;

    procedure refresh();
    function validate() : boolean;
    procedure loadData(id : integer);
    function addQuestionMatch(id : integer; test : boolean = false) : integer;

    procedure GridResize(Sender: TObject);
    procedure GridEditingDone(Sender: TObject);
    procedure bPreviewClick(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bEditorClick(Sender: TObject);
    procedure mQuestionChange(Sender: TObject);
    procedure mAnswerChange(Sender: TObject);
    procedure GridSelectionChanged(Sender: TObject; ALeft, ATop, ARight, ABottom: Integer);
    procedure mQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    resourceId, designerId, matchId : integer;
  end;

var
  fQuestionMatch: TfQuestionMatch;

implementation

uses UnitMain, UnitTDE, UnitTypes;

{$R *.dfm}

procedure TfQuestionMatch.refresh();
begin
  fMain.fillComboWithQuery(cbAgeClass, 'SELECT CONCAT(Title, " - ", Description) FROM ageclasses ORDER BY ID');
  eTitle.Text := '';
  cbAgeClass.ItemIndex := 0;
  resourceId := -1;
  designerId := StrToInt(fMain.loginUserID);
  matchId := -1;
  mAnswer.Text := '';
  mQuestion.Text := '';
  cbState.ItemIndex := 0;
  meCorrectorId.Text := '';

  Grid.RowCount := 2;
  Grid.ClearRows(1,1);
  Grid.Cells[0,1] := '1';
  pEditor.Visible := false;

  eTitle.SetFocus;
end;
function TfQuestionMatch.validate() : boolean;
begin
  Result := (eTitle.Text <> '');
  if not Result then
  begin
    fMain.MyShowMessage('لطفا برای مسابقه یك عنوان مناسب انتخاب كنید');
    exit;
  end;

  Result := Result and (meCorrectorId.Text <> '    ');
  Result := Result and (fMain.recordExists('SELECT * FROM users WHERE ID = '+ meCorrectorId.Text));
  if not Result then
  begin
    fMain.MyShowMessage('تصحیح کننده معتبر نیست');
    exit;
  end;

  Result := Result and (not fMain.recordExists('SELECT matches.ID FROM matches INNER JOIN supports ON matches.ID = supports.MatchID WHERE supports.CurrentState = "active" AND matches.Title = "'+ fMain.correctString(eTitle.Text) +'" AND matches.ID <> '+ IntToStr(matchId)));
  if not Result then
  begin
    fMain.MyShowMessage('عنوان این مسابقه، قبلا برای مسابقه‌ی دیگری انتخاب شده است. در یک رقابت دو مسابقه با عنوان مشابه نمی‌توانند فعال باشند.');
    exit;
  end;
end;
procedure TfQuestionMatch.loadData(id : integer);
var i : integer;
begin
  refresh;
  matchId := id;
  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT Title, AgeClass, DesignerID, ResourceID, CorrectorID, CurrentState FROM matches INNER JOIN supports ON matches.ID = supports.MatchID WHERE matches.ID = '+ IntToStr(matchId);
    Open;

    eTitle.Text := FieldByName('Title').AsString;
    cbAgeClass.ItemIndex := FieldByName('AgeClass').AsInteger;
    cbState.ItemIndex := ord(StringToState(FieldByName('CurrentState').AsString));
    meCorrectorId.Text := FieldByName('CorrectorID').AsString;

    designerId := FieldByName('DesignerID').AsInteger;
    resourceId := FieldByName('ResourceID').AsInteger;

    SQL.Text := 'SELECT * FROM questions WHERE MatchID = '+ IntToStr(matchId) +' ORDER BY ID';
    Open;

    for i := 1 to RecordCount do
    begin
      Grid.Cells[0,i] := FieldByName('ID').AsString;
      Grid.Cells[1,i] := FieldByName('Question').AsString;
      Grid.Cells[2,i] := FieldByName('Answer').AsString;
      Grid.AddRow;
      Next;
    end;
    Grid.Cells[0,RecordCount+1] := IntToStr(RecordCount+1);
  end;
end;
function TfQuestionMatch.addQuestionMatch(id : integer; test : boolean) : integer;
var i, q : Integer; answer : string;
begin
  Result := fMain.InsertOrUpdate('matches', 'ID = '+ IntToStr(id), ['DesignerID', 'Title', 'AgeClass', 'ResourceID'], [designerId, fMain.correctString(eTitle.Text), cbAgeClass.ItemIndex, resourceId]);
  if Result <> -1 then id := Result;

  fMain.executeCommand('DELETE FROM questions WHERE MatchID = '+ IntToStr(id));
  q := 1;
  for i := 1 to Grid.RowCount-1 do
  if Grid.Cells[1,i] <> '' then
  begin
    if Grid.Cells[2,i] <> '' then answer := '"'+ fMain.correctString(Grid.Cells[2,i]) +'"' else answer := 'NULL';
    fMain.executeCommand('INSERT INTO questions (MatchID, ID, Question, Answer) VALUES ('+ IntToStr(id) +', '+ IntToStr(q) +', "'+ fMain.correctString(Grid.Cells[1,i]) +'", '+ answer +')');
    inc(q);
  end;

  if not test then
    fMain.InsertOrUpdate('supports', 'TournamentID = 1 AND MatchID = '+ IntToStr(id), ['TournamentID', 'MatchID', 'CorrectorID', 'CurrentState'], [1, id, meCorrectorId.Text, StateToString(TMatchState(cbState.ItemIndex))]);
end;

// GUI
procedure TfQuestionMatch.GridEditingDone(Sender: TObject);
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

procedure TfQuestionMatch.GridResize(Sender: TObject);
begin
  Grid.Columns[1].Width := Round( ( Grid.Width - Grid.Columns[0].Width )/2 ) - 11;
  Grid.Columns[2].Width := Grid.Columns[1].Width;
end;

procedure TfQuestionMatch.GridSelectionChanged(Sender: TObject; ALeft, ATop, ARight, ABottom: Integer);
begin
  mQuestion.Text := Grid.Cells[1,Grid.Row];
  mAnswer.Text := Grid.Cells[2,Grid.Row];
end;

procedure TfQuestionMatch.mAnswerChange(Sender: TObject);
begin
  Grid.Cells[2,Grid.Row] := mAnswer.Text;

  if Grid.Cells[1, Grid.RowCount-1] <> '' then
  begin
    Grid.AddRow;
    Grid.Cells[0, Grid.RowCount-1] := IntToStr(Grid.RowCount-1);
  end;
end;

procedure TfQuestionMatch.bEditorClick(Sender: TObject);
begin
  mQuestion.Text := Grid.Cells[1,Grid.Row];
  mAnswer.Text := Grid.Cells[2,Grid.Row];
  pEditor.Visible := not pEditor.Visible;
end;

procedure TfQuestionMatch.bPreviewClick(Sender: TObject);
var id : integer;
begin
{
  if validate then
  begin
    id := addQuestionMatch(-1, true);
    F_TDE.GetFastReport('0', '310000', 'Preview', False, True);
    fMain.executeCommand('DELETE FROM matches WHERE ID = '+ IntToStr(id));
    fMain.executeCommand('DELETE FROM questions WHERE MatchID = '+ IntToStr(id));
  end;
}
end;

procedure TfQuestionMatch.FormCreate(Sender: TObject);
var sc : TMatchState;
begin
  cbState.Items.Clear;
  for sc := mActive to mImported do
    cbState.Items.Add(StateToPersian(sc));
end;

procedure TfQuestionMatch.bApplyClick(Sender: TObject);
begin
  if validate then
  begin
    addQuestionMatch(matchId);
    refresh;
  end;
end;

procedure TfQuestionMatch.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{x
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
}end;

procedure TfQuestionMatch.mQuestionChange(Sender: TObject);
begin
  Grid.Cells[1,Grid.Row] := mQuestion.Text;

  if Grid.Cells[1, Grid.RowCount-1] <> '' then
  begin
    Grid.AddRow;
    Grid.Cells[0, Grid.RowCount-1] := IntToStr(Grid.RowCount-1);
  end;
end;

procedure TfQuestionMatch.mQuestionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then mAnswer.SetFocus;
end;

end.
