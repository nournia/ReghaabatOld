unit UnitChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, Spin, DB, ADODB, Planner,
  PlanSimpleEdit, AdvMemo, AdvmSQLS, TeEngine,
  TeeDBEdit, TeeDBCrossTab, TeeData, Series, TeeProcs, Chart, ExtDlgs,
  AdvGroupBox, AdvPanel, AdvGlowButton, AdvSpin, AdvAppStyler, AdvOfficeButtons,
  AdvSplitter, UnitMaster, AdvChartView, AdvChartViewGDIP, DBAdvChartViewGDIP, AdvChart,
  AdvChartUtil, AdvChartGDIP;

type
  TfChart = class(TMaster)
    qryGetMatch: TADOQuery;
    dlg1: TSavePictureDialog;
    qryTemp: TADOQuery;
    AdvPanel1: TAdvPanel;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AQTemp: TADOQuery;
    AdvGroupBox4: TAdvGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl2: TLabel;
    edtExtra: TEdit;
    seMax: TAdvSpinEdit;
    chk2: TAdvOfficeCheckBox;
    edtTitle: TEdit;
    AdvPanel3: TAdvPanel;
    AQGtemp: TADOQuery;
    dsChart: TDataSource;
    cht: TDBAdvGDIPChartView;
    AdvGroupBox2: TAdvGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    medtFH: TMaskEdit;
    medtTH: TMaskEdit;
    cbbDate: TComboBox;
    AdvGroupBox5: TAdvGroupBox;
    lbl10: TLabel;
    cbbCS: TComboBox;
    AdvGroupBox1: TAdvGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    Label2: TLabel;
    cbbSex: TComboBox;
    cbbAge: TComboBox;
    ME_Code: TMaskEdit;
    AdvGroupBox6: TAdvGroupBox;
    AdvGroupBox7: TAdvGroupBox;
    RG_TS: TAdvOfficeRadioGroup;
    btn4: TAdvGlowButton;
    btnChart: TAdvGlowButton;
    cbbMatch: TComboBox;
    cbbResume: TComboBox;
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    function MakeQuery() : String;
    procedure ME_CodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbbSexChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbResumeSelect(Sender: TObject);
    procedure cbbMatchSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChart: TfChart;
  SQ, Title : string;

implementation

uses UnitMain;

{$R *.dfm}

function TfChart.MakeQuery() : String;
var
  age, DI : string;
begin
  age := fMain.options.Values['ChildAge'];
  case cbbDate.ItemIndex of
    0: DI := '10';
    1: DI := '7';
    2: DI := '4';
  end;

  if RG_TS.ItemIndex = 0 then
  begin
    Title := cbbCS.Text + ' مسابقات ';
    if cbbMatch.ItemIndex <> 0 then Title := Title + cbbMatch.Items[cbbMatch.ItemIndex] + ' ';
    Title := Title + 'برده شده ';
  end else
  begin
    Title := cbbCS.Text + ' مسابقات آزاد ';
    if cbbResume.ItemIndex <> 0 then Title := Title + cbbResume.Items[cbbResume.ItemIndex] + ' ';
  end;

  if ME_Code.Text <> '    ' then Title := Title + 'کد ' + ME_Code.Text else
  begin
    case cbbSex.ItemIndex of
      1: Title := Title + 'توسط آقایان ';
      2: Title := Title + 'توسط خانم‌ها ';
    end;
    case cbbAge.ItemIndex of
      1: Title := Title + '- نونهالان';
      2: Title := Title + '- بزرگسالان';
    end;
  end;

  if RG_TS.ItemIndex = 0 then
  begin
    SQ := 'SELECT Left([D_Raft],'+DI+') AS D, ';

    if cbbCS.ItemIndex = 0 then SQ := SQ + 'Sum([Cash]![Emtiaz]+[Cash]![Kholase]) AS C ';
    if cbbCS.ItemIndex = 1 then SQ := SQ + 'Count(Cash.[Student Code]) AS C ';

    SQ := SQ + 'FROM (Cash INNER JOIN Users ON Cash.[Student Code] = Users.ID) INNER JOIN MatchInfo ON Cash.[Examin Code] = MatchInfo.MatchID WHERE (';

    if ME_Code.Text <> '    ' then SQ := SQ +'((Cash.[Student Code])="'+ ME_Code.Text+'") AND ' else
    begin
      if cbbSex.ItemIndex = 1 then SQ := SQ +'((Users.[Is Men])=True) AND ';
      if cbbSex.ItemIndex = 2 then SQ := SQ +'((Users.[Is Men])=False) AND ';
      if cbbAge.ItemIndex = 1 then SQ := SQ + '(('+Copy( fMain.getShamsiDate, 1, 4 )+'-CInt(Left([Users]![T_T],4)))<='+age+') AND ';
      if cbbAge.ItemIndex = 2 then SQ := SQ + '(('+Copy( fMain.getShamsiDate, 1, 4 )+'-CInt(Left([Users]![T_T],4)))>'+age+') AND ';
    end;

    if cbbMatch.ItemIndex <> 0 then SQ := SQ + ' ((MatchInfo.MatchID) Like "3'+ IntToStr(cbbMatch.ItemIndex) +'%") AND ';
    SQ := SQ + '(((Cash.D_Raft)>="'+medtFH.Text+'" And (Cash.D_Raft)<="'+medtTH.Text+'")) AND ((Cash.D_Raft) Is Not Null))' + 'GROUP BY Left([D_Raft],'+DI+') ';

    if cbbCS.ItemIndex = 0 then SQ := SQ + 'HAVING (((Sum([Cash]![Emtiaz]+[Cash]![Kholase]))>1))';
    if cbbCS.ItemIndex = 1 then SQ := SQ + 'HAVING (((Count(Cash.[Student Code]))>1))';

    SQ := SQ + 'ORDER BY Left([D_Raft],'+DI+');';
  end else
  begin
    SQ := 'SELECT Left([Date],'+DI+') AS D, ';

    if cbbCS.ItemIndex = 0 then SQ := SQ + 'Sum([Resume]![Score]) AS C ';
    if cbbCS.ItemIndex = 1 then SQ := SQ + 'Count([Resume]![Score]) AS C ';

    SQ := SQ + 'FROM Users INNER JOIN Resume ON Users.ID = Resume.ID WHERE (';

    if ME_Code.Text <> '    ' then SQ := SQ +'((Resume.ID)="'+ ME_Code.Text+'") AND ' else
    begin
      if cbbSex.ItemIndex = 1 then SQ := SQ +'((Users.[Is Men])=True) AND ';
      if cbbSex.ItemIndex = 2 then SQ := SQ +'((Users.[Is Men])=False) AND ';
      if cbbAge.ItemIndex = 1 then SQ := SQ + '(('+Copy( fMain.getShamsiDate, 1, 4 )+'-CInt(Left([Users]![T_T],4)))<='+age+') AND ';
      if cbbAge.ItemIndex = 2 then SQ := SQ + '(('+Copy( fMain.getShamsiDate, 1, 4 )+'-CInt(Left([Users]![T_T],4)))>'+age+') AND ';
    end;

    if cbbResume.ItemIndex <> 0 then SQ := SQ + ' (Resume.Kind = 5'+ IntToStr(cbbResume.ItemIndex) +') AND ';
    SQ := SQ + '(((Resume.Date)>="'+medtFH.Text+'" And (Resume.Date)<="'+medtTH.Text+'")) AND ((Resume.Date) Is Not Null)) GROUP BY Left([Date],'+DI+')' + ' HAVING (((Sum([Resume]![Score]))>1)) ORDER BY Left([Date],'+DI+');';
  end;

  Result := SQ;
{
  qry1.SQL.Text := SQ;
  qry1.Open;
  edtExtra.Text := 'مجموع : ' + qry1.Fields[0].AsString;
}
end;

procedure TfChart.btn4Click(Sender: TObject);
begin
  if dlg1.Execute then
    cht.SaveToImage(fMain.AddExtension(dlg1.FileName, '.jpg') , cht.Width, cht.Height, itJPEG, 100);
end;

procedure TfChart.btnChartClick(Sender: TObject);
begin
  with cht.Panes[0].Series[0] do
  begin
    if seMax.Value <> 0 then
    begin
      AutoRange := arDisabled;
      Maximum := seMax.Value;
    end else AutoRange := arEnabledZeroBased;
  end;

  with cht.Panes[0] do
  begin
    Title.Text := edtTitle.Text;
    XAxis.Text := edtExtra.Text;
    Series[0].ShowValue := chk2.Checked;
  end;

  AQTemp.SQL.Text := MakeQuery;
  AQTemp.Open;
  if AQTemp.RecordCount > 0 then
  begin
    AQTemp.Close;
    qryGetMatch.SQL.Text := MakeQuery;
    qryGetMatch.Open;
    cht.Panes[0].Visible := true;
  end else cht.Panes[0].Visible := false;
  edtTitle.Text := Title;
end;

procedure TfChart.cbbMatchSelect(Sender: TObject);
begin
  if RG_TS.ItemIndex = 0 then btnChartClick(Self) else RG_TS.ItemIndex := 0;
end;

procedure TfChart.cbbResumeSelect(Sender: TObject);
begin
  if RG_TS.ItemIndex = 1 then btnChartClick(Self) else RG_TS.ItemIndex := 1;
end;

procedure TfChart.cbbSexChange(Sender: TObject);
begin
  ME_Code.Text := '    ';
  btnChart.Click;
end;

procedure TfChart.FormCreate(Sender: TObject);
begin
  with cht.Panes[0] do
  begin
    DataSource := dsChart;

    XAxis.Text := '';
    YAxis.Text := '';
    Legend.Visible := false;

    Margin.RightMargin := 30;
    YAxis.Size := 60;

    with Series[0] do
    begin
      FieldNameValue := 'C';
      FieldNameXAxis := 'D';

      AutoRange := arEnabledZeroBased;
      ChartType := ctBar;
      Color := $00C08000;
      ColorTo := $00C08000;
      Opacity := 255;
      OpacityTo := 125;
      ShowValue := true;
      ValueFont.Size := 8;
      GradientType := gtHorizontal;
      ValueWidth := 80;
      Valuefont.Color := Color;
//      XAxis.TextBottom.Angle := 90;

      Background.GradientType := gtSolid;
      //Background.Angle := 180;
      //Background.HatchStyle := HatchStyleWeave;
      Background.Color := RGB(255, 255, 210);
      cht.Color := Background.Color;
      BackGround.ColorTo := clWhite;
    end;
  end;
end;

procedure TfChart.FormShow(Sender: TObject);
begin
  if fMain.ICMatch.Visible then
  begin
    AQTemp.SQL.Text := 'SELECT Options.* FROM Options;';
    AQTemp.Open;
    medtFH.Text := AQTemp.FieldByName('MatchDate').AsString;
    medtTH.Text := fMain.getShamsiDate;
    btnChart.Click;
  end;
end;

procedure TfChart.ME_CodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then btnChart.Click;
end;

end.


