unit UnitExImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  ExtCtrls, ADODB, DB, AdvPanel, AdvAppStyler, Grids, BaseGrid, AdvGrid,
  DBAdvGrid, AdvGlowButton, Mask, AdvSpin, StdCtrls, AdvGroupBox, AdvSplitter,
  DBCtrls, Diff, AdvCGrid, Dialogs, UnitMaster, AdvScrollBox, AdvProgressBar, MyAccess;

type
  TfImport = class(TMaster)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    CB_Match: TComboBox;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvGlowButton2: TAdvGlowButton;
    spShow: TAdvSplitter;
    AdvPanel3: TAdvPanel;
    pShow: TAdvPanel;
    AdvGroupBox1: TAdvGroupBox;
    spPicture: TAdvSplitter;
    AdvGroupBox3: TAdvGroupBox;
    Label3: TLabel;
    L_Code: TLabel;
    L_Name: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    L_Grid: TLabel;
    Label9: TLabel;
    L_Score: TLabel;
    Label11: TLabel;
    L_Age: TLabel;
    gbPicture: TAdvGroupBox;
    Image1: TImage;
    AdvGroupBox2: TAdvGroupBox;
    AdvScrollBox1: TAdvScrollBox;
    L_ShowMatch: TLabel;
    gbSame: TAdvGroupBox;
    gSame: TAdvColumnGrid;
    gMain: TAdvColumnGrid;
    AdvGlowButton3: TAdvGlowButton;
    bShow: TAdvGlowButton;
    gOther: TAdvColumnGrid;
    bAdd: TAdvGlowButton;
    bReplaceAll: TAdvGlowButton;
    spSame: TAdvSplitter;
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure bReplaceAllClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CB_MatchChange(Sender: TObject);

    function Add(otherMatchID, mainMatchID : string) : boolean;
    function LCS( s1, s2 : String ) : Integer;
    procedure MakeLCSCompare(q1, q2 : TADOQuery);
    function getNewID(otherMatchID : string): string;
    function GetMatchContent(matchID : String; qry : TMyQuery): String;
    procedure MakeQuery();
    procedure bShowClick(Sender: TObject);
    procedure gOtherGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure gOtherCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
    procedure gOtherDblClick(Sender: TObject);
    procedure gMainDblClick(Sender: TObject);
    procedure gSameDblClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Diff: TDiff;
    MatchKind : array[300000..400000] of ShortInt; // 0 : New, neg : Replaceable with MatchSame[i,1], pos : Same as MatchSame[i,0..MatchKind]
    MatchSame : array[300000..400000] of array[1..50] of Integer;
    selectedMatches : integer;
  end;

var
  fImport: TfImport;

implementation

uses UnitMain, UnitDesignBC, UnitDesignWP;

{$R *.dfm}

function TfImport.LCS( s1, s2 : String ) : Integer;
var
  i, C, L : Integer;
begin
  if s1 = s2 then Result := 100 else
  begin
    Diff.Execute(pchar(s1), pchar(s2), length(s1), length(s2));
    C := 0;
    for i := 0 to Diff.count-1 do if Diff.Compares[i].Kind = ckNone then C := C + 1;
    L := Round((length(s1) + length(s2))/2);
    if l = 0 then Result := 0 else Result := Round(C / L * 100);
  end;
end;

procedure TfImport.MakeLCSCompare(q1, q2 : TADOQuery);
var
  i, j, src : Integer;
  srcTitle : String;
  first : boolean;
begin
  if (q1.RecordCount > 0) and (q2.RecordCount > 0) then
  begin
    q1.RecNo := 1;
    for i := 1 to q1.RecordCount do
    begin
      src := q1.Fields[0].AsInteger;
      MatchKind[src] := 0;
      srcTitle := q1.Fields[1].AsString;
      first := false;

      q2.RecNo := 1;
      for j := 1 to q2.RecordCount do
      begin
        if LCS(srcTitle, q2.Fields[1].AsString) > 85 then
        begin
          if MatchKind[src] = 0 then MatchKind[src] := 1;
          MatchSame[src, Abs(MatchKind[src])] := q2.Fields[0].AsInteger;

          if srcTitle = q2.Fields[1].AsString then
          begin
            if first then MatchKind[src] := Abs(MatchKind[src]) else
            begin
              MatchKind[src] := -1 * MatchKind[src];
              MatchSame[src, Abs(MatchKind[src])] := MatchSame[src, 1];
              MatchSame[src, 1] := q2.Fields[0].AsInteger;
            end;
            first := true;
          end;

          if MatchKind[src] > 0 then inc(MatchKind[src]) else dec(MatchKind[src]);
        end;
        q2.Next;
      end;

      if MatchKind[src] < 0 then bReplaceAll.Enabled := true;
      fMain.ProgressContinue;
      q1.Next;
    end;
  end;
end;

function TfImport.getNewID(otherMatchID : string): string;
begin
  fMain.qTmp.SQL.Text := 'SELECT MAX(ID)+1 FROM Matches WHERE ID div 1000 = '+ LeftStr(otherMatchID, 3);
  fMain.qTmp.Open;

  if fMain.qTmp.Fields[0].AsString = '' then
    Result := LeftStr(otherMatchID, 3) + '001'
  else
    Result := fMain.qTmp.Fields[0].AsString;

  if LeftStr(Result, 3) <> LeftStr(otherMatchID, 3) then Result := ''; // group is full
end;

function TfImport.GetMatchContent(matchID : String; qry : TMyQuery): String;
var
  i, j, k, src : Integer;
  Mark : Boolean;
begin
  qry.SQL.Text:= 'SELECT * FROM Matches WHERE ID = '+ MatchID;
  qry.Open;
  L_Code.Caption := qry.FieldByName('ID').AsString;
  L_Name.Caption := qry.FieldByName('Title').AsString;
  L_Score.Caption := qry.FieldByName('MaxScore').AsString;
  L_Age.Caption := qry.FieldByName('Age').AsString;
  L_ShowMatch.Caption := '';
  Image1.Picture := nil;

  if (LeftStr(MatchID, 2) = '31') or (LeftStr(MatchID, 2) = '34') then
  begin
    qry.SQL.Text:= 'SELECT * FROM Questions WHERE MatchID = '+ MatchID;
    qry.Open;
    for i := 1 to qry.RecordCount do
    begin
      L_ShowMatch.Caption := L_ShowMatch.Caption + IntToStr(i) + '. ' + qry.FieldByName('Question').AsString + #13 + '    ' + qry.FieldByName('Answer').AsString + #13;
      qry.Next;
    end;
    gbPicture.Width := 1;
    spPicture.Width := 0;
  end
  else if (LeftStr(MatchID, 2) = '32') or (LeftStr(MatchID, 2) = '33') then
  begin
    L_ShowMatch.Caption := qry.FieldByName('Content').AsString;
    fMain.loadJpeg(MatchID, 'match', Image1, qry);
    gbPicture.Width := 160;
    spPicture.Width := 2;
  end;

  if qry = fMain.qTmp then
  begin
    L_Grid.Caption := 'راست';
    gbSame.Width := 1;
    spSame.Width := 0;
  end else
  begin
    L_Grid.Caption := 'چپ';
    gbSame.Width := 250;
    spSame.Width := 2;

    gSame.RemoveRows(2, gSame.RowCount-2);
    gSame.ClearRows(1,1);

    src := StrToInt(matchID);
    for i := 1 to Abs(MatchKind[src])-1 do
    begin
      gSame.AddRow;
      fMain.qTmp.SQL.Text := 'SELECT Title FROM Matches WHERE ID = '+ IntToStr(MatchSame[src, i]);
      fMain.qTmp.Open;
      gSame.Cells[2,i] := IntToStr(MatchSame[src, i]);
      gSame.Cells[1,i] := fMain.qTmp.FieldByName('Title').AsString;
      if L_Name.Caption = fMain.qTmp.FieldByName('Title').AsString then gSame.RowColor[i] := $002FDEFD;
    end;
    if Abs(MatchKind[src]) >= 2 then gSame.RemoveRows(Abs(MatchKind[src]),1);
  end;

  if not pShow.Visible then bShowClick(nil);
end;

procedure TfImport.gMainDblClick(Sender: TObject);
begin
  if gMain.Cells[3, gMain.Row] <> '' then
    GetMatchContent(gMain.Cells[3, gMain.Row], fMain.qTmp);
end;

procedure TfImport.gOtherCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  if MatchKind[StrToInt(gOther.Cells[3, ARow])] < 0 then
  begin
    if State then
      fMain.MyShowMessage('مسابقات آبی رنگ را نمی توان افزود');
  end else if State then inc(selectedMatches) else dec(selectedMatches);
  bAdd.Enabled := (selectedMatches > 0);
end;

procedure TfImport.gOtherDblClick(Sender: TObject);
begin
//  if gOther.Cells[3, gOther.Row] <> '' then GetMatchContent(gOther.Cells[3, gOther.Row], fMain.qTmpImport);
end;

procedure TfImport.gOtherGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var
  state : boolean; id : Integer;
begin
  if Arow > 0 then
  if gOther.Cells[3, ARow] <> '' then
  begin
    id := StrToInt(gOther.Cells[3, ARow]);
    gOther.GetCheckBoxState(0,ARow, state);

    if MatchKind[id] < 0 then ABrush.Color := $00FFE7D5 // blue
    else if state then ABrush.Color := $0080FFFF // yellow
    else if MatchKind[id] > 0 then ABrush.Color := $009797EA; // red
  end;
end;

procedure TfImport.gSameDblClick(Sender: TObject);
begin
  if gSame.Cells[2, gSame.Row] <> '' then
    GetMatchContent(gSame.Cells[2, gSame.Row], fMain.qTmp);
end;

procedure TfImport.bShowClick(Sender: TObject);
begin
  pShow.Visible := not pShow.Visible;
  spShow.Visible := pShow.Visible;
end;

procedure TfImport.AdvGlowButton2Click(Sender: TObject);
var i : integer;
begin
  for i := 1 to gOther.RowCount-1 do
    if MatchKind[StrToInt(gOther.Cells[3, i])] = 0 then
    begin
      gOther.setCheckBoxState(0,i, true);
      inc(selectedMatches);
    end;
  gOther.Repaint;
  bAdd.Enabled := (selectedMatches > 0);
end;

procedure TfImport.AdvGlowButton3Click(Sender: TObject);
begin
  gMain.SearchFooter.Visible := not gMain.SearchFooter.Visible;
  gOther.SearchFooter.Visible := gMain.SearchFooter.Visible;
end;

procedure TfImport.bReplaceAllClick(Sender: TObject);
var i, count, other : integer;
begin
{
  count := 0;
  for i := 1 to gOther.RowCount-1 do
    if MatchKind[StrToInt(gOther.Cells[3, i])] < 0 then inc(count);

  fMain.ProgressBegin('جایگزینی', count);
  for i := 1 to gOther.RowCount-1 do
  begin
    other := StrToInt(gOther.Cells[3, i]);
    if MatchKind[other] < 0 then
    begin
      try
        fMain.DeleteMatch(IntToStr(MatchSame[other, 1]));
        Add(IntToStr(other), IntToStr(MatchSame[other, 1]));
      except on E: Exception do
        fMain.MyShowMessage('جایگزینی '+ IntToStr(MatchSame[other, 1]) +' با '+ IntToStr(other) +' دچار مشکل شد');
      end;
      fMain.ProgressContinue;
    end;
  end;
  fMain.ProgressEnd('تعداد ' + IntToStr(count) + 'مسابقه جایگزین شدند');
}
end;

function TfImport.Add(otherMatchID, mainMatchID : string) : boolean; // from other to main
var designerTmp, qppTmp : string; i, tmp : Integer; bs: TADOBlobStream;
begin
  Result := False;
with fMain do
begin
  qTmpImport.SQL.Text := 'SELECT * FROM Matches WHERE ID = '+ otherMatchID;
  qTmpImport.Open;

  qTmp.SQL.Text := 'SELECT ID, Title FROM Matches WHERE Title = "'+ qTmpImport.FieldByName('Title').AsString +'"';
  qTmp.Open;

  if qTmp.RecordCount = 0 then
  begin
    designerTmp := qTmpImport.FieldByName('DesignerID').AsString; if designerTmp = '' then designerTmp := 'NULL';
    qppTmp := qTmpImport.FieldByName('QPPaper').AsString; if qppTmp = '' then qppTmp := '0';
    executeCommand('INSERT INTO Matches (ID, DesignerID, Title, MaxScore, Age, State, QPPaper, LibraryBookID, Tags, Author, Publication, Content, PictureConfiguration, GenuineID) '+
                   'VALUES ('+ mainMatchID +', '+ designerTmp +', "'+ qTmpImport.FieldByName('Title').AsString +'", '+ qTmpImport.FieldByName('MaxScore').AsString +', '+ qTmpImport.FieldByName('Age').AsString +', 1, '+ qTmpImport.FieldByName('QPPaper').AsString +', "'+ qTmpImport.FieldByName('LibraryBookID').AsString +'", "'+ qTmpImport.FieldByName('Tags').AsString +'", "'+ qTmpImport.FieldByName('Author').AsString +'", "'+ qTmpImport.FieldByName('Publication').AsString +'", "'+ qTmpImport.FieldByName('Content').AsString +'", "'+ qTmpImport.FieldByName('PictureConfiguration').AsString +'", '+ qTmpImport.FieldByName('GenuineID').AsString +')');

    tmp := StrToInt(LeftStr(otherMatchID, 2));
    if (tmp = 31) or (tmp = 34) then
    begin
      qTmpImport.SQL.Text := 'SELECT * FROM Questions WHERE MatchID = '+ otherMatchID;
      qTmpImport.Open;

      for i := 1 to qTmpImport.RecordCount do
      begin
        executeCommand('INSERT INTO Questions (MatchID, ID, Question, Answer) VALUES ('+ mainMatchID +', '+ qTmpImport.FieldByName('ID').AsString +', "'+ qTmpImport.FieldByName('Question').AsString +'", "'+ qTmpImport.FieldByName('Answer').AsString +'")');
        qTmpImport.Next;
      end;
    end else if (tmp = 32) or (tmp = 33) then
    begin
      qTmpImport.SQL.Text := 'SELECT * FROM Pictures WHERE Picture IS NOT NULL AND ID = '+ otherMatchID;
      qTmpImport.Open;

      if qTmpImport.RecordCount = 1 then
      begin
        bs := TADOBlobStream.Create(TBlobField(qTmpImport.FieldByName('Picture')),bmRead);
        qTmp.SQL.Text := 'SELECT * FROM Pictures'; qTmp.Open;
        qTmp.AppendRecord([mainMatchID, nil]);
        qTmp.Edit;
        TBlobField(qTmp.FieldByName('Picture')).LoadFromStream(bs);
        qTmp.Post;
        bs.Free;
      end;
    end;

    Result := True;
  end;
end;
end;

procedure TfImport.bAddClick(Sender: TObject);
var
  i : integer; state : boolean; newID : string;
begin
  fMain.ProgressBegin('افزودن', selectedMatches);
  for i := 1 to gOther.RowCount-1 do
  begin
    gOther.GetCheckBoxState(0,i, state);
    if state then
    begin
      newID := getNewID(gOther.Cells[3,i]);

      if Add(gOther.Cells[3,i], newID) then
      begin
        MatchKind[StrToInt(gOther.Cells[3,i])] := -2;
        MatchSame[StrToInt(gOther.Cells[3,i]), 1] := StrToInt(newID);
        bReplaceAll.Enabled := true;
      end;
      fMain.ProgressContinue;
    end;
  end;
  fMain.ProgressEnd;
  MakeQuery;
end;

procedure TfImport.CB_MatchChange(Sender: TObject);
begin
  MakeQuery;
end;

procedure TfImport.FormCreate(Sender: TObject);
begin
  Diff := TDiff.Create(self);
end;

procedure TfImport.FormResize(Sender: TObject);
begin
  gMain.Width := Round((fImport.Width - 30)/2);
  gOther.Width := gMain.Width;
end;

procedure TfImport.MakeQuery();
var
  i : integer;
  Filter, Level : String;
begin
  Filter := ''; Level := '' ;
  if CB_Match.ItemIndex <> 0 then Filter := 'WHERE ID div 10000 = 3' + IntToStr(CB_Match.ItemIndex);

  fMain.qTmp.SQL.Text := 'SELECT ID, Title, Tags FROM Matches '+ Filter +' ORDER BY ID';
  fMain.qTmp.Open;
  gMain.RowCount := 2;
  gMain.ClearRows(1,1);
  for i := 1 to fMain.qTmp.RecordCount do
  begin
    gMain.AddRow;
    gMain.Cells[1,i] := fMain.qTmp.FieldByName('Tags').AsString;
    gMain.Cells[2,i] := fMain.qTmp.FieldByName('Title').AsString;
    gMain.Cells[3,i] := fMain.qTmp.FieldByName('ID').AsString;
    fMain.qTmp.Next;
  end;
  if fMain.qTmp.RecordCount > 0 then gMain.RemoveRows(fMain.qTmp.RecordCount+1,1);

  fMain.qTmpImport.SQL.Text := fMain.qTmp.SQL.Text;
  fMain.qTmpImport.Open;
  gOther.RowCount := 2;
  gOther.ClearRows(1,1);
  for i := 1 to fMain.qTmpImport.RecordCount do
  begin
    gOther.AddRow;
    gOther.Cells[1,i] := fMain.qTmpImport.FieldByName('Tags').AsString;
    gOther.Cells[2,i] := fMain.qTmpImport.FieldByName('Title').AsString;
    gOther.Cells[3,i] := fMain.qTmpImport.FieldByName('ID').AsString;
    fMain.qTmpImport.Next;
  end;
  if fMain.qTmpImport.RecordCount > 0 then gOther.RemoveRows(fMain.qTmpImport.RecordCount+1,1);
  gOther.AddCheckBoxColumn(0);
end;

end.
