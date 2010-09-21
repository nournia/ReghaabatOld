unit UnitTDE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, AdvOfficePager, AdvOfficePagerStylers, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, StdCtrls, ExtCtrls, Mask, Grids, BaseGrid, AdvGrid,
  DBAdvGrid, AdvGlowButton, Spin, AdvAppStyler, AdvSpin, Menus, AdvGroupBox,
  AdvPanel, DB, ADODB, frxClass, AdvOfficeButtons, UnitMaster, JPEG, Printers,
  MemDS, DBAccess, MyAccess;

type
  TF_TDE = class(TMaster)
    AdvOfficePager: TAdvOfficePager;
    P_Tahvil: TAdvOfficePage;
    P_Dariaft: TAdvOfficePage;
    P_Score: TAdvOfficePage;
    AdvOfficeTabSet: TAdvOfficeTabSet;
    gScore: TDBAdvGrid;
    gReceive: TDBAdvGrid;
    fs: TAdvFormStyler;
    AdvPanel2: TAdvPanel;
    AdvGlowButton3: TAdvGlowButton;
    S_GroupBox1: TAdvGroupBox;
    lbl11: TLabel;
    lbl6: TLabel;
    S_Label10: TLabel;
    lbl8: TLabel;
    SpinEdit1: TAdvSpinEdit;
    lbl9: TLabel;
    S_Label4: TLabel;
    S_Label2: TLabel;
    dsReceive: TDataSource;
    dsScore: TDataSource;
    gDeliver: TDBAdvGrid;
    dsDeliver: TDataSource;
    AdvPanel1: TAdvPanel;
    B_Preview: TAdvGlowButton;
    B_Ok: TAdvGlowButton;
    ps: TAdvPanelStyler;
    pgMatch: TAdvOfficePager;
    AdvOfficePage2: TAdvOfficePage;
    AdvOfficePage3: TAdvOfficePage;
    AdvOfficePage4: TAdvOfficePage;
    AdvOfficePage5: TAdvOfficePage;
    AdvGroupBox1: TAdvGroupBox;
    MaskEdit3: TMaskEdit;
    Label14: TLabel;
    MaskEdit4: TMaskEdit;
    Label2: TLabel;
    Label180: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    Label230: TLabel;
    AdvGroupBox2: TAdvGroupBox;
    Label26: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label31: TLabel;
    Label38: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    AdvGroupBox3: TAdvGroupBox;
    Label41: TLabel;
    Label44: TLabel;
    Label19: TLabel;
    Label47: TLabel;
    MaskEdit2: TMaskEdit;
    AdvGroupBox4: TAdvGroupBox;
    Label49: TLabel;
    Label52: TLabel;
    Label17: TLabel;
    Label55: TLabel;
    MaskEdit1: TMaskEdit;
    Label30: TLabel;
    Label34: TLabel;
    Label10: TLabel;
    Label42: TLabel;
    Label11: TLabel;
    Label48: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    PrintCheckBox: TAdvOfficeCheckBox;
    T_CheckBoxLibrary: TAdvOfficeCheckBox;
    D_CheckBoxLibrary: TAdvOfficeCheckBox;
    LCPaint: TLabel;
    LCWork: TLabel;
    LCCD: TLabel;
    LCBook: TLabel;
    B_Pay: TAdvGlowButton;
    qReceive: TMyQuery;
    qScore: TMyQuery;
    qDeliver: TMyQuery;
    procedure MaskEdit4Change(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure B_OkClick(Sender: TObject);
    procedure B_PreviewClick(Sender: TObject);
    procedure B_PayClick(Sender: TObject);
    procedure SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit1Change(Sender: TObject);
    procedure AdvOfficeTabSetChange(Sender: TObject);
    procedure AdvOfficePagerChange(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure gReceiveGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure gReceiveCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
    procedure gReceiveCanEditCell(Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pgMatchChange(Sender: TObject);
    procedure MaskEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure ShowScore( );
    function isBookInLibrary( BookCode : String ) : Boolean;
    procedure GetFastReport(UserID, MatchID, Action : String; ForUser, NewPage : Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ExPaper : string;
  end;

var
  F_TDE: TF_TDE;

implementation

uses UnitMain;

{$R *.dfm}

procedure TF_TDE.GetFastReport(UserID, MatchID, Action : String; ForUser, NewPage : Boolean);
var
  R, i, j, size, x, Counter, CS : word;
  Ri :array of Word;
  OK : Boolean;
  MemoTemp : TfrxMemoView;
  PictureTemp : TfrxPictureView;
  Z, Zt, ph, pw, pt, pl : Double;
  tokpos : Integer;
  printer : TPrinter;
begin
  fMain.qfLibrary.Open;
  fMain.qfUser.SQL.Text:= 'SELECT ID, FirstName, LastName, BirthDate FROM Users WHERE ID = '+ UserID; fMain.qfUser.Open;
  fMain.qfMatch.SQL.Text:='SELECT Left(Matches.ID, 3)+"-"+Right(Matches.ID, 3) AS ID, DesignerID, Title, Age, MaxScore, State, QPPaper, Content, PictureConfiguration, Tags FROM Matches WHERE Matches.ID='+ MatchID; fMain.qfMatch.Open;
  fMain.qfPicture.SQL.Text:= 'SELECT * FROM Pictures WHERE ID = '+ MatchID; fMain.qfPicture.Open;

  fMain.LoadFastReport('Match');
  if fMain.options.Values['Paper'] = 'A5' then
  begin
    fMain.frxReport.PrintOptions.PrintMode := pmScale;
    fMain.frxReport.PrintOptions.PrintOnSheet := DMPAPER_A5;
  end;

  printer := TPrinter.Create;
  fMain.frxReport.PrintOptions.Printer := printer.Printers[StrToInt(fMain.options.Values['Printer'])];

  MemoTemp := fMain.frxReport.FindObject('Memo26') as TfrxMemoView;
  MemoTemp.Text := fMain.getShamsiDate;
  MemoTemp := fMain.frxReport.FindObject('mContent') as TfrxMemoView;
  MemoTemp.Text := fMain.qfMatch.FieldByName('Content').AsString;

  PictureTemp := fMain.frxReport.FindObject('pContent') as TfrxPictureView;
  if fMain.qfPicture.RecordCount = 1 then
  begin
    PictureTemp.LoadPictureFromStream(TADOBlobStream.Create(TBlobField(fMain.qfPicture.FieldByName('Picture')),bmRead));

    tokpos := 1;
    ph := StrToFloat(fMain.getNextToken(fMain.qfMatch.FieldByName('PictureConfiguration').AsString, ' ', tokpos));
    pw := StrToFloat(fMain.getNextToken(fMain.qfMatch.FieldByName('PictureConfiguration').AsString, ' ', tokpos));
    pt := StrToFloat(fMain.getNextToken(fMain.qfMatch.FieldByName('PictureConfiguration').AsString, ' ', tokpos));
    pl := StrToFloat(fMain.getNextToken(fMain.qfMatch.FieldByName('PictureConfiguration').AsString, ' ', tokpos));
    Z := MemoTemp.Width / 80 ;
    PictureTemp.Height := ph * Z;
    PictureTemp.Width := pw * Z;
    PictureTemp.Top := MemoTemp.Top + pt * Z;
    PictureTemp.Left := MemoTemp.Left + pl * Z;
  end else
  begin
    PictureTemp.Picture := nil;
    PictureTemp.Width := 0;
    PictureTemp.Height := 0;
    PictureTemp.Top := 0;
    PictureTemp.Left := 0;
  end;

  if (Copy(MatchID, 2, 1) = '1') or (Copy(MatchID, 2, 1) = '4') then
  begin
    Counter := fMain.qfMatch.FieldByName('QPPaper').AsInteger;
    fMain.qTmp.SQL.Text:='SELECT * FROM Questions WHERE MatchID = '+ MatchID;
    fMain.qTmp.Open;

    Size := fMain.qTmp.RecordCount;
    MemoTemp.Text := '';
    if Size < Counter then Counter := Size;

    Randomize;
    if ForUser then
    begin
      SetLength( Ri, Counter );   i := 0;
      While( i < Counter ) do
      begin
        OK:=True;
        x:= Round(100000*Random) mod Size +1;
        for j:=0 to i do if x=Ri[j] then OK:=False;
        if OK = True then
        begin
          Ri[i]:=x;
          i:=i+1;
        end;
      end;

      if Counter <> 0 then
      for i:=0 to Counter-1 do
      begin
        fMain.qTmp.RecNo := Ri[i];
        MemoTemp.Text := MemoTemp.Text + IntToStr(i+1) + '. ' + fMain.qTmp.FieldByName('Question').AsString;
      end;
    end else
    begin
      for i := 1 to Size do
      begin
        MemoTemp.Text := MemoTemp.Text + IntToStr(i) + '. ' + fMain.qTmp.FieldByName('Question').AsString + '  پاسخ : ' + fMain.qTmp.FieldByName('Answer').AsString;
        fMain.qTmp.Next;
      end;
    end;
  end;

  fMain.qTmp.SQL.Text:='SELECT * FROM Sentences';
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount <> 0 then fMain.qTmp.RecNo := Round(100000 * Random) mod fMain.qTmp.RecordCount;

  MemoTemp := fMain.frxReport.FindObject('Memo24') as TfrxMemoView;
  MemoTemp.Text := fMain.qTmp.FieldByName('Sentence').AsString + '   ' + fMain.qTmp.FieldByName('Person').AsString;

  MemoTemp := fMain.frxReport.FindObject('Memo25') as TfrxMemoView;
  if LeftStr(MatchID, 2) = '31' then MemoTemp.Text := fMain.options.Values['BookTip'] else
  if LeftStr(MatchID, 2) = '32' then MemoTemp.Text := fMain.options.Values['WorkTip'] else
  if LeftStr(MatchID, 2) = '33' then MemoTemp.Text := fMain.options.Values['PaintTip'] else
  if LeftStr(MatchID, 2) = '34' then MemoTemp.Text := fMain.options.Values['MultiMediaTip'];

  if fMain.frxReport.PrepareReport(NewPage) then
  begin
    if Action = 'Print' then fMain.frxReport.Print
    else if Action = 'Preview' then fMain.frxReport.ShowPreparedReport
  end;

  fMain.frxReport.PrintOptions.PrintMode := pmDefault;
  fMain.frxReport.PrintOptions.PrintOnSheet := 0;
end;

function TF_TDE.isBookInLibrary( BookCode : String ) : Boolean;
var
  i: Integer;
  DLGText: String;
  Temp : integer;
begin
  fMain.qTmpLibrary.SQL.Text := 'SELECT Objects.[Object Count], [Is Men].Caption + " " + Users.ID as Name FROM ((Cash INNER JOIN Objects ON Cash.ObjectID = Objects.[Object ID]) INNER JOIN Users ON Cash.UserID ' +
  '= Users.ID) INNER JOIN [Is Men] ON Users.[Is Men] = [Is Men].[Is] WHERE (((Cash.Date_Bargasht) Is Null)AND ((Cash.ObjectID)="'+BookCode+'"));';
  fMain.qTmpLibrary.Open;
  if ((fMain.qTmpLibrary.RecordCount <> 0) and (fMain.qTmpLibrary.FieldByName('Object Count').AsInteger <= fMain.qTmpLibrary.RecordCount)) then
  begin
    DLGText:= 'شئ این مسابقه در دست : ';
    for i := 1 to fMain.qTmpLibrary.RecordCount do
     begin
       DLGText := DLGText + fMain.qTmpLibrary.FieldByName('Name').AsString;
       if i <> fMain.qTmpLibrary.RecordCount then DLGText := DLGText + ' , ' else DLGText := DLGText + ' می‌باشد';
       fMain.qTmpLibrary.Next;
     end;
    fMain.MyShowMessage( DLGText );
    Result := False;
  end else
    Result := True;
end;

procedure TF_TDE.ShowScore();
var
  Score, K : Integer;
begin
  fMain.qTmp.SQL.Text := 'SELECT ScoreSum FROM '+ fMain.sqlUserScores(fMain.userID) +' WHERE ID='+ fMain.userID;
  fMain.qTmp.Open;
  S_Label2.Caption := IntToStr(fMain.qTmp.Fields[0].AsInteger);

  fMain.qTmp.SQL.Text := 'SELECT Round(Sum(Score)) FROM Payments WHERE UserID='+ fMain.userID +' AND ScoreDate >= "' + fMain.options.Values['BeginDate'] +'"';
  fMain.qTmp.Open;
  S_Label4.Caption := IntToStr(fMain.qTmp.Fields[0].AsInteger);

  S_Label10.Caption := IntToStr(StrToInt(S_Label2.Caption) - StrToInt(S_Label4.Caption));
end;

procedure TF_TDE.SpinEdit1Change(Sender: TObject);
var
  UserAccess: Boolean;
begin
  UserAccess := True;
  if ( SpinEdit1.Value = 0 )or( StrToInt(S_Label10.Caption) - SpinEdit1.Value < -50 ) then
    UserAccess := False;

  if UserAccess then B_Pay.Enabled := True else B_Pay.Enabled := False;
end;

procedure TF_TDE.SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( key = 13 )and( B_Pay.Enabled ) then
  begin
    B_Pay.Click;
    SpinEdit1.SetFocus;
  end;
end;

procedure TF_TDE.AdvOfficePagerChange(Sender: TObject);
begin
  case AdvOfficePager.ActivePageIndex of
    0: pgMatchChange(nil);
    1: gReceive.SetFocus;
    2: SpinEdit1.SetFocus;
  end;
end;

procedure TF_TDE.AdvOfficeTabSetChange(Sender: TObject);
var
  i: integer;
begin
  if AdvOfficeTabSet.ActiveTabIndex = 0 then
  begin
    qScore.SQL.Text := 'SELECT OperatorID, Score, ScoreDate AS Title, "" AS MatchID FROM Payments WHERE ScoreDate >= "'+ fMain.options.Values['BeginDate'] +'" AND UserID='+ fMain.userID;
    qScore.Open;

    if fMain.isSuperUser then gScore.Options := gScore.Options + [goEditing];
    gScore.Columns[2].Header := 'تاریخ';
    gScore.Columns[3].Header := ' ';
    gScore.Columns[3].Width := 0;
  end else
  if AdvOfficeTabSet.ActiveTabIndex = 1 then
  begin
    qScore.SQL.Text := '(SELECT OperatorID, ROUND(RealScores.RealScore) AS Score, Matches.Title, Left(MatchID,3)+"-"+Right(MatchID,3) AS MatchID FROM '+ fMain.sqlRealScores(fMain.userID) +' INNER JOIN Matches ON RealScores.MatchID = Matches.ID) ' +
                       'UNION (SELECT OperatorID, Score, Title, Caption AS MatchID FROM FreeScores LEFT JOIN Groups ON FreeScores.GroupID = Groups.ID WHERE Groups.Kind = 0 AND UserID='+ fMain.userID +' AND ScoreDate >= "' + fMain.options.Values['BeginDate'] + '")';
    qScore.Open;

    gScore.Columns[2].Header := 'عنوان';
    gScore.Options := gScore.Options - [goEditing];
    gScore.Columns[3].Header := 'مسابقه';
    gScore.Columns[3].Width := 80;
  end;
end;

procedure TF_TDE.B_OkClick(Sender: TObject);
var
  ExCode, ExPaper : String;
  Ok : Boolean;
begin
  Ok := PrintCheckBox.Checked;

  case pgMatch.ActivePageIndex of
  0 :
  begin
    ExCode := MaskEdit4.Text;
    ExPaper := Label16.Caption;
    Label13.Caption:= '';
  end;
  1 :
  begin
    ExCode := MaskEdit2.Text;
    ExPaper := Label19.Caption;
    Label10.Caption := '';
  end;
  2 :
  begin
    ExCode := MaskEdit1.Text;
    ExPaper := Label17.Caption;
    Label11.Caption:= '';
  end;
  3 :
  begin
    ExCode := MaskEdit6.Text;
    ExPaper := Label31.Caption;
    Label30.Caption:= '';
  end;
  end;

  ExCode := fMain.StrToMatchID(ExCode);
  pgMatch.OnChange(pgMatch);
  B_Ok.Enabled := False;
  B_Preview.Enabled := False;

  fMain.executeCommand('INSERT INTO Transactions (UserID, MatchID, DeliverDate) VALUES ('+ fMain.userID +', '+ ExCode +', "'+ fMain.getShamsiDate +'")');

  if fMain.ICLibrary.Visible then
  begin
    if pgMatch.ActivePageIndex = 0 then
    if T_CheckBoxLibrary.Checked  then
    if isBookInLibrary( MaskEdit3.Text ) then
    begin
      fMain.qTmpLibrary.SQL.Text := ('SELECT * FROM Cash');
      fMain.qTmpLibrary.Open;
      fMain.qTmpLibrary.AppendRecord([ fMain.userID, MaskEdit3.Text, fMain.getShamsiDate, Null, Null, fMain.loginUserID ]);
    end;
    if pgMatch.ActivePageIndex = 3 then
    if T_CheckBoxLibrary.Checked  then
    if isBookInLibrary( MaskEdit5.Text ) then
    begin
      fMain.qTmpLibrary.SQL.Text := ('SELECT * FROM Cash');
      fMain.qTmpLibrary.Open;
      fMain.qTmpLibrary.AppendRecord([ fMain.userID, MaskEdit5.Text, fMain.getShamsiDate, Null, Null, fMain.loginUserID ]);
    end;
  end;

  if ok then GetFastReport(fMain.userID, ExCode, 'Print', True, True);

  fMain.B_Refresh.Click;
end;

procedure TF_TDE.B_PayClick(Sender: TObject);
begin
  if SpinEdit1.Value = 0 then Abort;

  fMain.executeCommand('INSERT INTO Payments (UserID, Score, ScoreDate, OperatorID) VALUES ('+ fMain.userID +', '+ SpinEdit1.Text +', "'+ fMain.getShamsiDate +'", '+ fMain.loginUserID +')');
  SpinEdit1.Value := 0;
  ShowScore;
  AdvOfficeTabSet.OnChange(AdvOfficeTabSet);
end;

procedure TF_TDE.B_PreviewClick(Sender: TObject);
var
  ExName : String;
begin
  case pgMatch.ActivePageIndex of
    0 : ExName := MaskEdit4.Text;
    1 : ExName := MaskEdit2.Text;
    2 : ExName := MaskEdit1.Text;
    3 : ExName := MaskEdit6.Text;
  end;

  ExName := fMain.StrToMatchID(ExName);
  GetFastReport(fMain.userID, ExName, 'Preview', True, True);
end;

procedure TF_TDE.pgMatchChange(Sender: TObject);
begin
  B_Preview.Enabled := false;
  B_Ok.Enabled := false;
  case pgMatch.ActivePageIndex of
    0: if fMain.ICLibrary.Visible then MaskEdit3.SetFocus else MaskEdit4.SetFocus;
    1: MaskEdit2.SetFocus;
    2: MaskEdit1.SetFocus;
    3: if fMain.ICLibrary.Visible then MaskEdit5.SetFocus else MaskEdit6.SetFocus;
  end;
end;

procedure TF_TDE.AdvGlowButton1Click(Sender: TObject);
begin
  gDeliver.Visible := AdvGlowButton1.Down;
  if AdvGlowButton1.Down then
    AdvGlowButton1.ImageIndex := 10
  else
    AdvGlowButton1.ImageIndex := 11;
end;

procedure TF_TDE.AdvGlowButton3Click(Sender: TObject);
var
  state: boolean;
  i:Word;
begin
  for i := 1 to gReceive.RowCount-1 do
  begin
    state := false;
    gReceive.GetCheckBoxState(0,i, state);
    if state then
    begin
      fMain.executeCommand('UPDATE Transactions SET ReceiveDate="'+ fMain.getShamsiDate +'" WHERE UserID = '+ fMain.userID +' AND MatchID = ' + gReceive.Cells[2, i]);
      if fMain.ICLibrary.Visible then
      begin
        if D_CheckBoxLibrary.Checked then
        begin
          fMain.qTmp.SQL.Text:='SELECT LibraryBookID FROM Matches WHERE ID = '+ gReceive.Cells[2,i];
          fMain.qTmp.Open;

          fMain.qTmpLibrary.SQL.Text := 'SELECT Cash.UserID, Cash.ObjectID, Cash.Date_Bargasht, Cash.Login_of_Bargasht FROM Cash '+
            'WHERE (((Cash.UserID)="'+ fMain.userID +'") AND ((Cash.ObjectID)="'+ fMain.qTmp.Fields[0].AsString +'") AND ((Cash.Date_Bargasht) Is Null)); ';
          fMain.qTmpLibrary.Open;

          if fMain.qTmpLibrary.RecordCount <> 0 then
          begin
            fMain.qTmpLibrary.Edit;
            fMain.qTmpLibrary.FieldByName('Date_Bargasht').AsString := fMain.getShamsiDate;
            fMain.qTmpLibrary.FieldByName('Login_of_Bargasht').AsString := fMain.loginUserID;
            fMain.qTmpLibrary.Post;
          end;
        end;
      end;

    end;
  end;
   fMain.B_Refresh.Click;
end;

procedure TF_TDE.gReceiveCanEditCell(Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol = 0;
end;

procedure TF_TDE.gReceiveCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  gReceive.RowSelect[Arow] := State;
end;

procedure TF_TDE.gReceiveGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var
  state: boolean;
begin
  if gReceive.GetCheckBoxState(0,ARow, state) then
  begin
    if state then
      ABrush.Color := gReceive.SelectionColorTo;
  end;
end;

procedure TF_TDE.FormCreate(Sender: TObject);
begin
  gReceive.FixedCols := 0;
  gReceive.Options := gReceive.Options + [goRowSelect, goEditing];
  gDeliver.FixedCols := 0;
end;

procedure TF_TDE.MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If key = 13 then
  begin
    if MaskEdit3.Text <> '   -   ' then
    begin
      fMain.qTmp.SQL.Text:='SELECT ID FROM Matches WHERE LibraryBookID = "'+ MaskEdit3.Text +'"';
      fMain.qTmp.Open;
      MaskEdit4.Text := LeftStr(fMain.qTmp.Fields[0].AsString, 3) + '-' + RightStr(fMain.qTmp.Fields[0].AsString, 3);
    end;
    MaskEdit4.SetFocus;
  end;
end;

procedure TF_TDE.MaskEdit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If key = 13 then
  begin
    if MaskEdit3.Text <> '   -   ' then
    begin
      fMain.qTmp.SQL.Text:='SELECT ID FROM Matches WHERE LibraryBookID = "'+ MaskEdit3.Text +'"';
      fMain.qTmp.Open;
      MaskEdit6.Text := LeftStr(fMain.qTmp.Fields[0].AsString, 3) + '-' + RightStr(fMain.qTmp.Fields[0].AsString, 3);
    end;
    MaskEdit6.SetFocus;
  end;
end;

procedure TF_TDE.MaskEdit4Change(Sender: TObject);
begin
  B_Preview.Enabled := False;
  B_Ok.Enabled := False;
end;

procedure TF_TDE.MaskEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  C1, LC : Integer;
  ExCode, ExName, ExKind, Temp : String;
  Ok, ExtraUser : Boolean;
begin
  if Key = 13 then
  begin
    B_Preview.Enabled := False;
    B_Ok.Enabled := False;

    if (fMain.P_LS.ImageIndex = 2) or (fMain.P_LS.ImageIndex = 1) then ExtraUser := True else ExtraUser := False;
    ExCode := fMain.StrToMatchID(TMaskEdit(Sender).Text);

    fMain.qTmp.SQL.Text:= 'SELECT ID, Title, State FROM Matches WHERE ID = '+ ExCode;
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount = 0 then
    begin
      fMain.MyShowMessage('چنین مسابقه‌ای وجود ندارد');
      TMaskEdit(Sender).SelectAll;
      Abort;
    end;

    ExName := fMain.qTmp.FieldByName('Title').AsString;
    ExPaper := fMain.cStates[StrToInt(fMain.qTmp.FieldByName('State').AsString)];

    Ok := true;
    ExKind := fMain.cMatches[pgMatch.ActivePageIndex-1];
    case pgMatch.ActivePageIndex of
    0 :
    begin
      Label13.Caption := ExName;
      Label16.Caption := ExPaper;
      if StrToInt(LCBook.Caption) >= StrToInt(fMain.options.Values['CBookMatch']) then
      begin
        Ok := false;
        LCBook.Font.Color := clRed;
      end;
    end;

    1 :
    begin
      Label10.Caption := ExName;
      Label19.Caption := ExPaper;
      if StrToInt(LCWork.Caption) >= StrToInt(fMain.options.Values['CWorkMatch']) then
      begin
        Ok := false;
        LCWork.Font.Color := clRed;
      end;
    end;

    2 :
    begin
      Label11.Caption := ExName;
      Label17.Caption := ExPaper;
      if StrToInt(LCPaint.Caption) >= StrToInt(fMain.options.Values['CPaintMatch']) then
      begin
        Ok := false;
        LCPaint.Font.Color := clRed;
      end;
    end;

    3 :
    begin
      Label30.Caption := ExName;
      Label31.Caption := ExPaper;
      if StrToInt(LCCD.Caption) >= StrToInt(fMain.options.Values['CCDMatch']) then
      begin
        Ok := false;
        LCCD.Font.Color := clRed;
      end;
    end;
    end;

    if ExPaper <> fMain.cStates[0] then
    begin
      fMain.MyShowMessage('این مسابقه ' + ExPaper + ' است و تحویل آن ممکن نیست');
      Abort;
    end;

    B_Preview.Enabled := True;

    fMain.qTmp.SQL.Text:= 'SELECT UserID, MatchID FROM Transactions WHERE UserID='+ fMain.userID +' AND MatchID='+ ExCode;
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount <> 0 then
    begin
      fMain.MyShowMessage('شما این مسابقه را قبلا برده‌اید');
      TMaskEdit(Sender).SelectAll;
      Abort;
    end;

    fMain.qTmp.SQL.Text:='SELECT Age FROM Matches WHERE ID='+ ExCode;
    fMain.qTmp.Open;
    C1 := fMain.qTmp.Fields[0].AsInteger;

    LC := C1 - StrToInt(fMain.LAge.Caption);
    if Abs(LC) > 1 then
    begin
      if (Abs(LC) > 3) and (ExtraUser = False) then
      begin
        fMain.MyShowMessage('اختلاف سن مناسب مسابقه با سن شما بیش از حد مجاز است');
        Abort;
      end;
      fMain.MyShowMessage('سن مناسب این مسابقه با سن شما '+ IntToStr(LC) +' سال اختلاف دارد');
    end;

    if not Ok then
    begin
      fMain.MyShowMessage('شما به تعداد کافی مسابقه در دست دارید');
      if ExtraUser = False then Abort;
    end;

{
    fMain.qTmp.SQL.Text:='SELECT Cash.[Examin Code] FROM Cash WHERE (((Cash.[Student Code])="'+ fMain.userID +'") AND ((Cash.[Examin Code]) Like "3'+ IntToStr( AdvOfficePager2.ActivePageIndex +1 ) +'%") AND ((Cash.D_Raft)="'+ShamsiDate( Date, 0 )+'"));';
    fMain.qTmp.Open;

    if fMain.qTmp.RecordCount >= 2 then
    begin
       fMain.MyShowMessage('امروز شما به اندازه كافی مسابقه '+ ExKind +' برده‌اید');
       if ExtraUser = False then Abort;
    end;
}

    B_Ok.Enabled := True;

    if fMain.ICLibrary.Visible then
    begin
      if pgMatch.ActivePageIndex = 0 then Temp := MaskEdit4.Text;
      if pgMatch.ActivePageIndex = 3 then Temp := MaskEdit6.Text;

      fMain.qTmp.SQL.Text:='SELECT LibraryBookID FROM Matches WHERE ID = '+Temp;
      fMain.qTmp.Open;

      if pgMatch.ActivePageIndex = 0 then MaskEdit3.Text := fMain.qTmp.Fields[0].AsString;
      if pgMatch.ActivePageIndex = 3 then MaskEdit5.Text := fMain.qTmp.Fields[0].AsString;

      if fMain.qTmp.RecordCount > 0 then
      begin
        if pgMatch.ActivePageIndex = 0 then
        if isBookInLibrary( MaskEdit3.Text ) then
        begin
          T_CheckBoxLibrary.Enabled := True;
          T_CheckBoxLibrary.Checked := True;
        end;

        if pgMatch.ActivePageIndex = 3 then
        if isBookInLibrary( MaskEdit5.Text ) then
        begin
          T_CheckBoxLibrary.Enabled := True;
          T_CheckBoxLibrary.Checked := True;
        end;
      end;
    end;

  end; // key == 13
end;

end.
