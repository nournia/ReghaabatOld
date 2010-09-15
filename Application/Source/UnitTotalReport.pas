unit UnitTotalReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid, DB, ADODB,
  Mask, Buttons, AdvPanel, AdvGlowButton, AdvGroupBox, AdvAppStyler, asgprev,
  AdvOfficeButtons, UnitMaster;

type
  TfTotalReport = class(TMaster)
    AdvPanel5: TAdvPanel;
    AdvGroupBox1: TAdvGroupBox;
    gTotalReport: TAdvColumnGrid;
    AdvPanel6: TAdvPanel;
    PrintScore: TAdvGlowButton;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    PreviewGrid: TAdvPreviewDialog;
    RG: TAdvOfficeRadioGroup;
    ME_Code: TMaskEdit;
    AdvGroupBox2: TAdvGroupBox;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    lPredict: TLabel;
    AdvPanel3: TAdvPanel;
    lDifference: TLabel;
    AdvPanel4: TAdvPanel;
    Label14: TLabel;
    lPayemnt: TLabel;
    AdvPanel2: TAdvPanel;
    Label2: TLabel;
    lRealScore: TLabel;
    Label15: TLabel;
    procedure PrintScoreClick(Sender: TObject);
    procedure RGClick(Sender: TObject);
    procedure ME_CodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RefreshInformation();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTotalReport: TfTotalReport;

implementation

uses UnitMain;

{$R *.dfm}

procedure TfTotalReport.PrintScoreClick(Sender: TObject);
var S : String;
begin
  gTotalReport.PrintSettings.RowSpacing := -20;
  gTotalReport.PrintSettings.TitleText := 'جمع امتیاز مسابقات';

  S := '';
  if RG.ItemIndex = 1 then S := ' برادران';
  if RG.ItemIndex = 2 then S := ' خواهران';
  if RG.ItemIndex = 3 then S := ' کد ' + ME_Code.Text;

  gTotalReport.PrintSettings.TitleText := gTotalReport.PrintSettings.TitleText + S;

  PreviewGrid.Grid := gTotalReport;
  PreviewGrid.Execute;
end;

procedure TfTotalReport.FormCreate(Sender: TObject);
var i: integer;
begin
  for i := 0 to gTotalReport.RowHeaders.Count -1 do
  begin
    gTotalReport.Cells[3,i] := gTotalReport.RowHeaders[i];
    if i < gTotalReport.RowHeaders.Count -2 then gTotalReport.AddRow;
  end;
  gTotalReport.Columns[1].Header := 'جمع امتیاز مسابقات';
end;

procedure TfTotalReport.ME_CodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  Begin
    RG.ItemIndex := 3;
    RefreshInformation;
  end;
end;

procedure TfTotalReport.RefreshInformation();
var i, j, Cr, T, SS, SC : integer; userCondition, userTmp : String;
begin
  gTotalReport.RemoveRows(2, gTotalReport.RowCount-2);
  userTmp := ME_Code.Text; if userTmp = '    ' then userTmp := '0';

  case RG.ItemIndex of
    1 : userCondition := 'AND Man = True';
    2 : userCondition := 'AND Man = False';
    3 : userCondition := 'AND UserID ='+ userTmp;
  end;

  fMain.qTmp.SQL.Text := '(SELECT Mid(MatchID,2,1) AS ID, Round(Sum(RealScore)) AS ScoreSum, Count(RealScore) AS ScoreCount FROM '+ fMain.sqlRealScores +' WHERE MatchID IS NOT NULL '+ userCondition +' GROUP BY Mid(MatchID,2,1) ORDER BY Mid(MatchID,2,1)) '+
                          'UNION (SELECT "5" AS ID, Sum(Score) AS ScoreSum, Count(Score) AS ScoreCount FROM FreeScores INNER JOIN Users ON FreeScores.UserID = Users.ID WHERE ScoreDate >= "'+ fMain.options.Values['BeginDate'] +'" '+ userCondition +')';
  fMain.qTmp.Open;
{
  fMain.qTmp1.SQL.Text := '(SELECT GroupID, Caption, Round(Sum(RealScore)) AS ScoreSum, Count(RealScore) AS ScoreCount FROM '+ fMain.sqlRealScores +' INNER JOIN Groups ON RealScores.GroupID = Groups.ID WHERE MatchID IS NOT NULL '+ userCondition +' GROUP BY GroupID, Caption ORDER BY GroupID) '+
                           'UNION (SELECT GroupID, Caption, Sum(Score) AS ScoreSum, Count(Score) AS ScoreCount FROM (FreeScores INNER JOIN Groups ON FreeScores.GroupID = Groups.ID) INNER JOIN Users ON FreeScores.UserID = Users.ID WHERE ScoreDate >= "'+ fMain.options.Values['BeginDate'] +'" '+ userCondition +' GROUP BY GroupID, Caption ORDER BY GroupID)';
  fMain.qTmp1.Open;
}
  Cr := 0; SS := 0; SC := 0;
  for i := 1 to 5 do
  begin
    gTotalReport.AddRow; Cr := Cr + 1;
    //gTotalReport.RowColor[Cr] := $002FDEFD;

    gTotalReport.Cells[3,Cr] := fMain.cMatches[i];
    gTotalReport.Cells[2,Cr] := IntToStr(fMain.qTmp.FieldByName('ScoreCount').AsInteger);
    gTotalReport.Cells[1,Cr] := IntToStr(fMain.qTmp.FieldByName('ScoreSum').AsInteger);

    SC := SC + StrToInt( gTotalReport.Cells[2,Cr] ) ;
    SS := SS + StrToInt( gTotalReport.Cells[1,Cr] ) ;
{
    if not fMain.qTmp1.IsEmpty then
    while fMain.qTmp.Fields[0].AsInteger = (fMain.qTmp1.Fields[0].AsInteger div 10) do
    begin
      gTotalReport.AddRow; Cr := Cr + 1;
      gTotalReport.RowColor[Cr] := $0096FEF9;

      gTotalReport.Cells[3,Cr] := fMain.qTmp1.FieldByName('Caption').AsString;
      gTotalReport.Cells[2,Cr] := fMain.qTmp1.FieldByName('ScoreCount').AsString;
      gTotalReport.Cells[1,Cr] := fMain.qTmp1.FieldByName('ScoreSum').AsString;
      if fMain.qTmp1.RecNo <> fMain.qTmp1.RecordCount then fMain.qTmp1.Next
      else
      begin
        fMain.qTmp1.Close;
        break;
      end;
    end;
}
    fMain.qTmp.Next;
  end;

  SC := SC + StrToInt( gTotalReport.Cells[2,Cr] ) ;
  SS := SS + StrToInt( gTotalReport.Cells[1,Cr] ) ;

  gTotalReport.AddRow; Cr := Cr + 1;
  gTotalReport.Cells[3,Cr] := 'جمع';

  gTotalReport.Cells[2,Cr] := IntToStr(SC);
  gTotalReport.Cells[1,Cr] := IntToStr(SS);
  gTotalReport.RowColor[Cr] := $00FFE7D5;
  gTotalReport.RemoveRows(Cr+1,1);
end;

procedure TfTotalReport.RGClick(Sender: TObject);
begin
  if RG.ItemIndex = 3 then ME_Code.SetFocus;
  RefreshInformation;
end;

end.
