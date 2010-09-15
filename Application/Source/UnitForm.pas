unit UnitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, AdvGlowButton, StdCtrls, AdvGroupBox, ExtCtrls, AdvPanel,
  AdvAppStyler, DB, ADODB, UnitMaster, Grids, BaseGrid, AdvGrid, AdvCGrid,
  AdvOfficeButtons;

type
  TF_Form = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    P_MatchEdit: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    ComboBox1: TComboBox;
    AdvGlowButton1: TAdvGlowButton;
    AdvGroupBox2: TAdvGroupBox;
    Label7: TLabel;
    Label1: TLabel;
    ComboBox2: TComboBox;
    AdvGlowButton2: TAdvGlowButton;
    fdLabel: TfrxUserDataSet;
    gLabel: TAdvColumnGrid;
    AdvGroupBox1: TAdvGroupBox;
    AdvGlowButton3: TAdvGlowButton;
    chMatchExists: TCheckBox;
    AdvGlowButton4: TAdvGlowButton;
    Label2: TLabel;
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure gLabelEditingDone(Sender: TObject);
    procedure fdLabelGetValue(const VarName: string; var Value: Variant);
    procedure AdvGlowButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Form: TF_Form;
  I, gRow, gLast, tcount : Integer;
  MatchStar : array[300000..400000] of Byte;
  first : boolean;

implementation

uses UnitMain;

{$R *.dfm}

procedure TF_Form.AdvGlowButton1Click(Sender: TObject);
var
  i : Integer;
  MemoTemp, MCode, MC1, MC2, MHeader : TfrxMemoView;
  ShapeTemp : TfrxShapeView;
begin
  fMain.qfLibrary.Close;
  fMain.qfLibrary.Open;

  I := ComboBox1.ItemIndex + 1;

  if ( I = 1 ) or ( I = 2 ) then
  begin
    fMain.LoadFastReport('BCForm');
    MCode := fMain.frxReport.FindObject('MemoObjCode') as TfrxMemoView;
    MC1 := fMain.frxReport.FindObject('MemoC1') as TfrxMemoView;
    MC2 := fMain.frxReport.FindObject('MemoC2') as TfrxMemoView;
    MHeader := fMain.frxReport.FindObject('MemoHeader') as TfrxMemoView;

    if I = 1 then
    begin
      MCode.Text := 'کد کتاب :';
      MC1.Text := 'پديد آورنده :';
      MC2.Text := 'تعداد صفحات کتاب :';
      MHeader.Text := 'فرم طراحي مسابقه کتاب';
    end else if I = 2 then
    begin
      MCode.Text := 'کد سي‌دي :';
      MC1.Text := 'پديد آورنده :';
      MC2.Text := 'مدت زمان :';
      MHeader.Text := 'فرم طراحي مسابقه سي‌دي';
    end;

    MCode.Visible := fMain.ICLibrary.Visible;
  end else
  if ( I = 3 ) or ( I = 4 ) then
  begin
    fMain.LoadFastReport('WPForm');
    MHeader := fMain.frxReport.FindObject('MemoHeader') as TfrxMemoView;

    if I = 3 then
      MHeader.Text := 'فرم طراحي مسابقه کارعملي'
    else if I = 4 then
      MHeader.Text := 'فرم طراحي مسابقه هنري';

    fMain.qTmp.SQL.Text := 'SELECT Caption FROM Groups WHERE Kind = '+ IntToStr(I-1) +' ORDER BY ID;';
    fMain.qTmp.Open;

    for i := 1 to 9 do
    begin
      MemoTemp := fMain.frxReport.FindObject('Memo'+IntToStr(i)) as TfrxMemoView;
      ShapeTemp := fMain.frxReport.FindObject('Shape'+IntToStr(i)) as TfrxShapeView;

      if MemoTemp = nil then Break;

      if i <= fMain.qTmp.RecordCount then
      begin
        MemoTemp.Text := fMain.qTmp.FieldByName('Caption').AsString;
        ShapeTemp.Visible := True;
        fMain.qTmp.Next;
      end else
      begin
        ShapeTemp.Visible := False;
        MemoTemp.Text := '';
      end;
    end;
  end;

  fMain.frxReport.ShowReport();
end;

procedure TF_Form.AdvGlowButton2Click(Sender: TObject);
var
  MemoTemp : TfrxMemoView;
begin
  fMain.qfLibrary.Close;
  fMain.qfLibrary.Open;

  I := ComboBox2.ItemIndex + 1;

  fMain.LoadFastReport('FreeForm');
  fMain.frxReport.Variables['Kind'] := IntToStr( I );

  if fMain.ICLibrary.Visible then
  begin
    MemoTemp := fMain.frxReport.FindObject('MemoBookCode') as TfrxMemoView;
    if MemoTemp <> nil then MemoTemp.Visible := True;
  end;

  fMain.frxReport.ShowReport();
end;

procedure TF_Form.AdvGlowButton3Click(Sender: TObject);
var sq : string; i, j, count : integer;
begin
  fMain.qfLibrary.Close; fMain.qfLibrary.Open;

  sq := 'SELECT ID, ';
  for i := 1 to 4 do
  begin
    sq := sq + 'IIf(Age>='+ fMain.options.Values['LvMin'+IntToStr(i)] +' And Age<='+ fMain.options.Values['LvMax'+IntToStr(i)] +', "';
    sq := sq + IntToStr(i);
    //for j := 1 to i do sq := sq + '*';
    sq := sq + '", ';
  end;
  sq := sq + '"0"';
  for i := 1 to 4 do sq := sq + ')';

  sq := sq + ' AS Star FROM Matches';

  fMain.qTmp.SQL.Text := sq;
  fMain.qTmp.Open;

  for i := 300000 to 400000 do MatchStar[i] := 0;
  for i := 1 to fMain.qTmp.RecordCount do
  begin
    if (fMain.qTmp.Fields[0].AsInteger > 300000) and (fMain.qTmp.Fields[0].AsInteger < 400000) then
      MatchStar[fMain.qTmp.Fields[0].AsInteger] := fMain.qTmp.Fields[1].AsInteger;
    fMain.qTmp.Next;
  end;

  count := 0;
  for i := 1 to gLabel.RowCount-1 do
  if (gLabel.Cells[2,i] <> '') and (gLabel.Cells[1,i] <> '') then
    count := count + StrToInt(gLabel.Cells[2,i]) - StrToInt(gLabel.Cells[1,i]) + 1;

  fdLabel.RangeEndCount := count;
  gRow := 1; gLast := 0; tcount := 0;

  fMain.LoadFastReport('Label');
  fMain.frxReport.ShowReport();
end;

procedure TF_Form.AdvGlowButton4Click(Sender: TObject);
var sq : string; i, j : integer;
begin
  fMain.qfLibrary.Close; fMain.qfLibrary.Open;

  sq := 'SELECT Left(ID,3)+"-"+Right(ID,3) AS MatchID, ';
  for i := 1 to 4 do
  begin
    sq := sq + 'IIf(Age>='+ fMain.options.Values['LvMin'+IntToStr(i)] +' And Age<='+ fMain.options.Values['LvMax'+IntToStr(i)] +', "';
    for j := 1 to i do sq := sq + '*';
    sq := sq + '", ';
  end;
  sq := sq + '"0"';
  for i := 1 to 4 do sq := sq + ')';
  sq := sq + ' AS Star FROM Matches WHERE ID IS NULL ';

  for i := 1 to gLabel.RowCount-1 do
  if (gLabel.Cells[2,i] <> '') and (gLabel.Cells[1,i] <> '') then
    sq := sq + 'OR (ID <= '+ gLabel.Cells[2,i] + ' AND ID >= '+ gLabel.Cells[1,i] +') ';
  sq := sq + 'ORDER BY ID';

  fMain.qfList.SQL.Text := sq;
  fMain.qfList.Open;

  fMain.LoadFastReport('Label');
  fMain.frxReport.ShowReport();
end;

procedure TF_Form.fdLabelGetValue(const VarName: string; var Value: Variant);
var i: integer;
begin
first := false;
if tcount = 0 then tcount := 1 else
begin
  tcount := 0;
  if VarName = 'MatchID' then
  begin
    while (Value = null) do
    begin
      if gLast < StrToInt(gLabel.Cells[1,gRow]) then gLast := StrToInt(gLabel.Cells[1,gRow])
      else if gLast < StrToInt(gLabel.Cells[2,gRow]) then
      begin
        inc(gLast);
        if gLast = StrToInt(gLabel.Cells[2,gRow]) then
          if (gRow+1 < gLabel.RowCount) and (gLabel.Cells[1,gRow+1] <> '') and (gLabel.Cells[2,gRow+1] <> '') then
          begin
            inc(gRow);
            first := true;
          end;
      end;
      if (not chMatchExists.Checked) or (MatchStar[gLast] <> 0) then
        Value := fMain.MatchIDToStr(IntToStr(gLast));
    end;
  end else if VarName = 'Star' then
  begin
    Value := '';
    if MatchStar[gLast] > 0 then
      for i := 1 to MatchStar[gLast] do Value := Value + '*';
    if first then gLast := 0;
  end;
end;
end;

procedure TF_Form.gLabelEditingDone(Sender: TObject);
var ok : boolean;
begin
  ok := true;

  if (gLabel.Cells[1, gLabel.Row] <> '') and (gLabel.Cells[2, gLabel.Row] = '') then gLabel.Cells[2, gLabel.Row] := gLabel.Cells[1, gLabel.Row]
  else if (gLabel.Cells[2, gLabel.Row] <> '') and (gLabel.Cells[1, gLabel.Row] = '') then gLabel.Cells[1, gLabel.Row] := gLabel.Cells[2, gLabel.Row]
  else ok := false;

  if ok then
  begin
    if StrToInt(gLabel.Cells[2, gLabel.Row]) < 311001 then gLabel.Cells[2, gLabel.Row] := '311001';
    if StrToInt(gLabel.Cells[1, gLabel.Row]) < 311001 then gLabel.Cells[1, gLabel.Row] := '311001';
    if StrToInt(gLabel.Cells[2, gLabel.Row]) < StrToInt(gLabel.Cells[1, gLabel.Row]) then
      gLabel.Cells[2, gLabel.Row] := gLabel.Cells[1, gLabel.Row];
  end;
  if gLabel.Col = 1 then gLabel.Col := 2
  else if gLabel.Col = 2 then
  begin
    gLabel.Col := 1;
    if gLabel.Row = gLabel.RowCount-1 then gLabel.AddRow;
    gLabel.Row := gLabel.Row + 1;
  end;
end;

end.
