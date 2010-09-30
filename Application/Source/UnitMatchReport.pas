unit UnitMatchReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  DBAdvGrid, asgprev, asgprint, Spin, frxClass, frxDBSet, AdvGlowButton,
  AdvPanel, Mask, AdvSpin, AdvAppStyler, AdvCGrid, AdvGroupBox, UnitMaster, UnitTypes;

type
  TfMatchList = class(TMaster)
    AdvPanel2: TAdvPanel;
    bEdit: TAdvGlowButton;
    BitBtn5: TAdvGlowButton;
    BitBtn2: TAdvGlowButton;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    CB_Match: TComboBox;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    Grid: TAdvColumnGrid;
    AdvGroupBox1: TAdvGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    CB_SortDir: TComboBox;
    CB_Sort: TComboBox;
    AdvGlowButton1: TAdvGlowButton;
    Label9: TLabel;
    spLevel: TAdvSpinEdit;
    bNewEntity: TAdvGlowButton;
    bNewQuestionMatch: TAdvGlowButton;
    procedure GridEditingDone(Sender: TObject);
    procedure GridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CB_MatchChange(Sender: TObject);
    procedure MakeQuery( Prev, changeGrid : Boolean );
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure bNewEntityClick(Sender: TObject);
    procedure bNewQuestionMatchClick(Sender: TObject);
  private
    { Private declarations }
  public
    state : TListState;
  end;

var
  fMatchList: TfMatchList;

implementation

uses UnitMain, StrUtils, UnitDesignBC, UnitReference, UnitDesignWP;

{$R *.dfm}

procedure TfMatchList.AdvGlowButton1Click(Sender: TObject);
begin
  MakeQuery(False, True);
end;

procedure TfMatchList.bEditClick(Sender: TObject);
var
  i : integer;
begin
{x
  if bEdit.Down then
  begin
    Grid.Options := Grid.Options + [goEditing];
    for i := 0 to Grid.ColCount-1 do Grid.Columns[i].ReadOnly := false;
    if state = 'resource' then
    begin

    end;
  end else
  begin
    Grid.Options := Grid.Options - [goEditing];
    for i := 0 to Grid.ColCount-1 do Grid.Columns[ i ].ReadOnly := true;
  end;
}
end;

procedure TfMatchList.BitBtn2Click(Sender: TObject);
var
  MemoTemp, MemoTemp2, MemoTemp3, MT1, MT2 : TfrxMemoView;
  visi : Boolean;
  str, beyt : string;
  ix : integer;
begin
{x
  MakeQuery(True, False);

  with fMain do
  begin
    str := 'لیست مسابقات';
    if CB_Match.ItemIndex <> 4 then str := str + ' ' + CB_Match.Text;
    if spLevel.Value > 0 then str := str + ' - ' + 'سطح ' + spLevel.Text;

    ix := 5;
    listHeader[0] := 'کد مسابقه'; listField[0] := '[fdList."ID"]'; listWidth[0] := 80;
    listHeader[1] := 'عنوان مسابقه'; listField[1] := '[fdList."Title"]'; listWidth[1] := 0;
    listHeader[2] := 'حداکثر امتیاز'; listField[2] := '[fdList."MaxScore"]'; listWidth[2] := 80;
    listHeader[3] := 'سن مناسب'; listField[3] := '[fdList."Age"]'; listWidth[3] := 80;
    listHeader[4] := 'گروه'; listField[4] := '[fdList."Caption"]'; listWidth[4] := 80;
    beyt := 'هرکس باید مسابقاتی را بگیرد که سن مناسب آنها مساوی با سن خودش و یا یک سال کمتر یا بیشتر باشد. در غیر این صورت به اجازه اپراتور نیاز دارد.';
    MakeFastList(fMain.qTmp.SQL.Text, str, beyt, ix, 1, 10);
  end;

  MakeQuery(False, False);
}
end;

procedure TfMatchList.BitBtn5Click(Sender: TObject);
begin
  Grid.SearchFooter.Visible := not Grid.SearchFooter.Visible;
end;

procedure TfMatchList.bNewEntityClick(Sender: TObject);
begin
  case state of
    lResource:
    begin
      fMain.showResourceForm;
      fResource.refresh;
    end;

    lInstructionMatch:
    begin
      fMain.showInstructionMatchForm;
      fInstructionMatch.refresh;
    end;
  end;
end;

procedure TfMatchList.CB_MatchChange(Sender: TObject);
var
  i, temp : integer;
begin
{x
  Grid.Columns[7].ComboItems.Clear;

  if CB_Match.ItemIndex = 4 then
  begin
    Grid.Columns[ 7 ].ReadOnly := True;
  end else
  begin
    Grid.Columns[ 7 ].ReadOnly := not BitBtn1.Down;
    fMain.qTmp.SQL.Text := 'SELECT Caption FROM Groups WHERE Kind = '+ IntToStr(CB_Match.ItemIndex+1) +' ORDER BY ID';
    fMain.qTmp.Open;
    for i := 1 to fMain.qTmp.RecordCount do
    begin
      Grid.Columns[7].ComboItems.Add(fMain.qTmp.FieldByName('Caption').AsString);
      fMain.qTmp.Next;
    end;
  end;

  temp := CB_Sort.ItemIndex;
  for I := 0 to Grid.ColCount - 1 do
    CB_Sort.Items[i] := Grid.Columns[Grid.ColCount - (i+1)].Header;
  CB_Sort.ItemIndex := temp;
  if CB_Sort.ItemIndex = -1 then CB_Sort.ItemIndex := 0;

  MakeQuery(False, True);
}
end;

procedure TfMatchList.FormCreate(Sender: TObject);
begin
{x
  with Grid.Columns[0].ComboItems do
  begin
    Clear;
    Add(fMain.cStates[0]);
    Add(fMain.cStates[1]);
    Add(fMain.cStates[2]);
  end;

  Grid.FixedCols := 0;
  Grid.Options := Grid.Options + [goEditing];
}
end;

procedure TfMatchList.GridDblClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  if ARow > 0 then
  if (not bEdit.Down) and (bEdit.Visible) then
  if Grid.Cells[0,ARow] <> '' then
  if fMain.loginUser >= uDesigner then
  begin
    case state of
      lResource:
      begin
        fMain.showResourceForm;
        fResource.loadData(StrToInt(Grid.Cells[0,ARow]));
      end;
      lQuestionMatch:
      begin
        fMain.showQuestionMatchForm;
        fQuestionMatch.loadData(StrToInt(Grid.Cells[0,ARow]));
      end;
      lInstructionMatch:
      begin
        fMain.showInstructionMatchForm;
        fInstructionMatch.loadData(StrToInt(Grid.Cells[0,ARow]));
      end;
    end;
  end;
end;

procedure TfMatchList.GridEditingDone(Sender: TObject);
begin
  //
end;
{x
var
  state, group, maxscore, fitage, updatecmd : string;
  x : integer;
  first : boolean;
begin
  first := true; state := ''; group := ''; maxscore := ''; fitage := '';

  updatecmd := 'UPDATE Matches SET ';

  for x := 0 to 2 do if fMain.cStates[x] = Grid.Cells[0,Grid.Row] then state := 'State = ' + IntToStr(x);
  if state <> '' then
  begin
    updatecmd := updatecmd + state;
    first := false;
  end;

  if CB_Match.ItemIndex <> 4 then
  begin
    if not first then updatecmd := updatecmd + ', ';
    updatecmd := updatecmd + 'Tags = "'+ Grid.Cells[7,Grid.Row] +'"';
    first := false;
  end;

  x := StrToInt(Grid.Cells[6,Grid.Row]); if (x >= 0)and(x <= 10000) then maxscore := 'MaxScore = '+ Grid.Cells[6,Grid.Row];
  if maxscore <> '' then
  begin
    if not first then updatecmd := updatecmd + ', ';
    updatecmd := updatecmd + maxscore;
    first := false;
  end;

  x := StrToInt(Grid.Cells[4,Grid.Row]); if (x >= 7)and(x <= 100) then fitage := 'Age = '+ Grid.Cells[4,Grid.Row];
  if fitage <> '' then
  begin
    if not first then updatecmd := updatecmd + ', ';
    updatecmd := updatecmd + fitage;
  end;

  if not first then
  begin
    updatecmd := updatecmd + ' WHERE ID = '+ fMain.StrToMatchID(Grid.Cells[9,Grid.Row]);
    try fMain.executeCommand(updatecmd); except  end;
  end;
end;
}

procedure TfMatchList.MakeQuery(Prev, changeGrid : Boolean);
var
  Sort, i, j : Integer;
  sql, Group, FA, Level : String;
  rc : TResourceContent;
begin
  case state of
    lResource:
    begin
      sql := 'CASE(Kind) ';
      for rc := rBook to rWebPage do
        sql := sql + 'WHEN "'+ ResourceToString(rc) +'" THEN "'+ ResourceToPersian(rc) +'" ';
      sql := sql + 'END';
      sql := 'SELECT resources.ID, resources.Title AS Resource, authors.Title, publications.Title, '+ sql +' AS Kind, ageclasses.Title AS AgeClass, CreatorID FROM ((resources LEFT JOIN authors ON resources.AuthorID = authors.ID) LEFT JOIN publications ON resources.PublicationID = publications.ID) LEFT JOIN ageclasses ON resources.AgeClass = ageclasses.ID';

      if fMain.loginUser = uDesigner then sql := sql + ' WHERE resources.CreatorID = '+ fMain.loginUserID;
    end;

    lQuestionMatch:
    begin
      sql := 'SELECT matches.ID, matches.Title, ageclasses.Title AS AgeClass, matches.QPPaper, matches.DesignerID, QuestionCount, AnswerCount FROM (matches LEFT JOIN ageclasses ON matches.AgeClass = ageclasses.ID) '+
             'LEFT JOIN (SELECT MatchID, COUNT(Question) AS QuestionCount, COUNT(Answer) AS AnswerCount FROM questions GROUP BY MatchID) AS qs ON matches.ID = qs.MatchID WHERE matches.ResourceID IS NOT NULL';

      if fMain.loginUser = uDesigner then sql := sql + ' AND matches.DesignerID = '+ fMain.loginUserID;
    end;

    lInstructionMatch:
    begin
      sql := 'SELECT matches.ID, matches.Title, ageclasses.Title AS AgeClass, categories.Title, matches.DesignerID FROM (matches LEFT JOIN ageclasses ON matches.AgeClass = ageclasses.ID) '+'LEFT JOIN categories ON matches.CategoryID = categories.ID WHERE matches.ResourceID IS NULL';

      if fMain.loginUser = uDesigner then sql := sql + ' AND matches.DesignerID = '+ fMain.loginUserID;
    end;
  end;

  with fMain do
  begin
    myQuery.SQL.Text := sql;
    myQuery.Open;

    Grid.RemoveRows(2, Grid.RowCount-2);
    Grid.ClearRows(1, 1);
    for i := 1 to myQuery.RecordCount do
    begin
      if i <> myQuery.RecordCount then Grid.AddRow;
      for j := 0 to myQuery.FieldCount - 1 do
        Grid.Cells[j, i] := myQuery.Fields[j].AsString;
      myQuery.Next;
    end;
  end;
{x
  CB_Sort.ItemIndex := 9 - Grid.SortSettings.Column;
  if Grid.SortSettings.Direction = sdAscending then CB_SortDir.ItemIndex := 0 else  CB_SortDir.ItemIndex := 1;

  Group := ''; FA := '';
  if CB_Match.ItemIndex <> 4 then Group := ' AND Matches.ID div 10000 = 3' + IntToStr(CB_Match.ItemIndex+1) +' ';
  if Prev then FA := ' AND Matches.State = 0 ';
  if spLevel.Value > 0 then Level := ' AND Age >= '+ fMain.options.Values['LvMin'+spLevel.Text] + ' AND Age <= '+ fMain.options.Values['LvMax'+spLevel.Text];

  SQLT := 'SELECT Left(Matches.ID, 3)+"-"+Right(Matches.ID, 3) AS ID, Title, MaxScore, DesignerID, Age, QPPaper, Tags, CountOfQuestion, CountOfAnswer, CASE State WHEN 0 THEN "'+ fMain.cStates[0] +'" WHEN 1 THEN "'+ fMain.cStates[1]+ '" WHEN 2 THEN "'+ fMain.cStates[2] +'" ELSE "" END AS tState '+
          'FROM (Matches LEFT JOIN (SELECT MatchID, Count(Question) AS CountOfQuestion, Count(Answer) AS CountOfAnswer FROM Questions GROUP BY MatchID) AS qs ON Matches.ID = qs.MatchID) '+
          'WHERE Matches.ID <> 1 '+ Group + FA + Level + ' ';

  case CB_Sort.ItemIndex of
    0: SQLT := SQLT + 'ORDER BY Matches.ID';
    1: SQLT := SQLT + 'ORDER BY Title';
    2: SQLT := SQLT + 'ORDER BY Tags';
    3: SQLT := SQLT + 'ORDER BY MaxScore';
    4: SQLT := SQLT + 'ORDER BY DesignerID';
    5: SQLT := SQLT + 'ORDER BY Age';
    6:
    begin
      if (CB_Match.ItemIndex <> 1) and (CB_Match.ItemIndex <> 2) then
        SQLT := SQLT + 'ORDER BY QPPaper'
      else SQLT := SQLT + 'ORDER BY Matches.ID';
    end;
    7:
    begin
      if (CB_Match.ItemIndex <> 1) and (CB_Match.ItemIndex <> 2) then
        SQLT := SQLT + 'ORDER BY CountOfQuestion'
      else SQLT := SQLT + 'ORDER BY Matches.ID';
    end;
    8:
    begin
      if (CB_Match.ItemIndex <> 1) and (CB_Match.ItemIndex <> 2) then
        SQLT := SQLT + 'ORDER BY CountOfAnswer'
      else SQLT := SQLT + 'ORDER BY Matches.ID';
    end;
    9: SQLT := SQLT + 'ORDER BY State';
  end;

  if (CB_SortDir.ItemIndex = 1) and (CB_Sort.ItemIndex >= 0) and ((CB_Match.ItemIndex = 0) or (CB_Match.ItemIndex = 1) or ((CB_Sort.ItemIndex <> 7) and (CB_Sort.ItemIndex <> 6))) then
    SQLT := SQLT + ' DESC';

  fMain.qTmp.SQL.Text := SQLT;
  fMain.qTmp.Open;
  if (changeGrid) and (fMain.ICMatch.Visible) then
  begin
    Grid.RemoveRows(2, Grid.RowCount-2);
    Grid.ClearRows(1, 1);
    for i := 1 to fMain.qTmp.RecordCount do
    begin
      fMain.qTmp.RecNo := i;
      if i <> fMain.qTmp.RecordCount then Grid.AddRow;

      Grid.Cells[9,i] := fMain.qTmp.FieldByName('ID').AsString;
      Grid.Cells[8,i] := fMain.qTmp.FieldByName('Title').AsString;
      Grid.Cells[7,i] := fMain.qTmp.FieldByName('Tags').AsString;
      Grid.Cells[6,i] := fMain.qTmp.FieldByName('MaxScore').AsString;
      Grid.Cells[5,i] := fMain.qTmp.FieldByName('DesignerID').AsString;
      Grid.Cells[4,i] := fMain.qTmp.FieldByName('Age').AsString;
      Grid.Cells[3,i] := fMain.qTmp.FieldByName('QPPaper').AsString;
      Grid.Cells[2,i] := fMain.qTmp.FieldByName('CountOfQuestion').AsString;
      Grid.Cells[1,i] := fMain.qTmp.FieldByName('CountOfAnswer').AsString;
      Grid.Cells[0,i] := fMain.qTmp.FieldByName('tState').AsString;
    end;
  end;
}
end;

procedure TfMatchList.bNewQuestionMatchClick(Sender: TObject);
var i : integer;
begin
  if Grid.Cells[0,Grid.Row] <> '' then
    if state = lResource then
    begin
      fMain.showQuestionMatchForm;
      fQuestionMatch.refresh;

      with fMain.myQuery do
      begin
        SQL.Text := 'SELECT * FROM resources WHERE ID = '+ Grid.Cells[0,Grid.Row];
        Open;
        fQuestionMatch.resourceId := FieldByName('ID').AsInteger;
        fQuestionMatch.eTitle.Text := FieldByName('Title').AsString;
        fQuestionMatch.cbAgeClass.ItemIndex := FieldByName('AgeClass').AsInteger;
      end;
    end;
end;

end.
