unit UnitOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Buttons,
  ExtCtrls, Mask, AdvSpin, AdvGroupBox, AdvPanel, AdvGlowButton, AdvAppStyler,
  DBCtrls, ExtDlgs, AdvOfficePager, AdvOfficeButtons, UnitMaster, DBTables,
  AdvProgressBar, jpeg, ComObj, Spin, AdvCGrid, Printers, MemDS, DBAccess,
  MyAccess, StrUtils;

type
  TfOptions = class(TMaster)
    AdvPanel2: TAdvPanel;
    bApply: TAdvGlowButton;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvOfficePager2: TAdvOfficePager;
    advfcpg2: TAdvOfficePage;
    AdvOfficePage1: TAdvOfficePage;
    AdvGroupBox4: TAdvGroupBox;
    Label6: TLabel;
    eTitle: TEdit;
    AdvGroupBox5: TAdvGroupBox;
    iLibrary: TImage;
    SpeedButton1: TAdvGlowButton;
    SpeedButton2: TAdvGlowButton;
    LicenseOfficePage: TAdvOfficePage;
    AdvGroupBox6: TAdvGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    eComputerId: TEdit;
    eLicence: TEdit;
    AdvGlowButton4: TAdvGlowButton;
    AdvOfficePage2: TAdvOfficePage;
    AdvGroupBox10: TAdvGroupBox;
    AdvGroupBox12: TAdvGroupBox;
    AdvGroupBox9: TAdvGroupBox;
    Label12: TLabel;
    eCaption: TEdit;
    gGroup: TDBAdvGrid;
    AdvOfficePage3: TAdvOfficePage;
    AdvGroupBox8: TAdvGroupBox;
    bReplace: TAdvGlowButton;
    aqTable: TADOTable;
    Label9: TLabel;
    Label10: TLabel;
    AdvGlowButton8: TAdvGlowButton;
    AdvPanel1: TAdvPanel;
    Label7: TLabel;
    AdvGlowButton5: TAdvGlowButton;
    dsGroup: TDataSource;
    AdvGlowButton1: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    Label11: TLabel;
    chServer: TAdvOfficeCheckBox;
    eServerAddress: TButtonedEdit;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton7: TAdvGlowButton;
    qGroup: TMyQuery;
    AdvGlowButton11: TAdvGlowButton;
    AdvGroupBox7: TAdvGroupBox;
    Label5: TLabel;
    Label14: TLabel;
    cbPaper: TComboBox;
    chDownGrade: TAdvOfficeCheckBox;
    chAutoConnectLibrary: TAdvOfficeCheckBox;
    cbPrinter: TComboBox;
    T_CheckBoxLibrary: TAdvOfficeCheckBox;
    procedure eComputerIdClick(Sender: TObject);
    procedure eLicenceClick(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bReplaceClick(Sender: TObject);
    procedure ReplaceInTable( tname : string );
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton7Click(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure eServerAddressRightButtonClick(Sender: TObject);
    procedure chServerClick(Sender: TObject);
    procedure AdvGlowButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Valid, imgChange : Boolean;
  end;

var
  fOptions: TfOptions;

implementation

uses UnitMain, UnitUser, uCryptography, UFaDate, UnitTypes;

{$R *.dfm}

procedure moveTable(tableName : string; fields : array of string; values : array of string);
var fieldString, valueString, cmd : string; i, j, fieldCount : integer;
begin
with fMain do
begin
  // init
  fieldCount := Length(fields) - 1; fieldString := ''; valueString := '';
  for j := 0 to fieldCount do
  begin
    fieldString := fieldString + fields[j];
    valueString := valueString + values[j];
    if j <> fieldCount then
    begin
      fieldString := fieldString + ',';
      valueString := valueString + ',';
    end;
  end;

  // query
  cmd := 'INSERT INTO '+ tableName +' ('+ fieldString + ') VALUES (';
  for j := 0 to fieldCount do
  begin
    cmd := cmd +':'+ fields[j];
    if j <> fieldCount then cmd := cmd + ',';
  end;
  myCommand.SQL.Text := cmd + ');';

  // insert
  qImport.SQL.Text := 'SELECT '+ valueString +' FROM '+ tableName;
  qImport.Open;
  if qImport.RecordCount > 0 then
  begin
    for i := 1 to qImport.RecordCount do
    begin
      try
        for j := 0 to fieldCount do
        begin
          if EndsStr('Date', values[j]) then
            myCommand.ParamValues[fields[j]] := TFaDate.Create(qImport.FieldByName(values[j]).AsString).ToGregorianDate
          else if fields[j] = 'Gender' then
          begin
            if qImport.FieldByName(values[j]).AsBoolean then myCommand.ParamValues[fields[j]] := GenderToString(gMale) else myCommand.ParamValues[fields[j]] := GenderToString(gFemale);
          end else
            myCommand.ParamValues[fields[j]] := qImport.FieldByName(values[j]).AsVariant;
        end;

        myCommand.Execute;
      except on E: Exception do
        MyShowMessage(tableName + '->' + qImport.Fields[0].AsString);
      end;
      qImport.Next;
    end;
  end;
end;
end;
{
function getDateRefinedField(field : string): string;
var i : integer;
begin
  Result := '';
  for i := 1 to 11 do
    Result := Result + 'Replace(';
  Result := Result + field;
  for i := 1 to 9 do
    Result := Result + ', "'+ IntToStr(i) +' ", " '+ IntToStr(i) +'")';
  Result := Result + ', " ", "0")';
  Result := Result + ', "00", "01")';
end;
}

function getRefined(v : Variant) : Variant;
begin
  if v = null then
    Result := -1
  else
    Result := v;
end;
procedure TfOptions.AdvGlowButton11Click(Sender: TObject);
var i, matchId, questionId, authorId, publicationId : integer;  tmp, tmp2 : string; resource : boolean;
begin
with fMain do
begin
  cImport.Close;
  cImport.ConnectionString:= AddressToConnectionString('D:\Flash\Project\Match\DBs\Genuine_Reghaabat.mdb');
  cImport.Open;

{
  // users
  //tmp := 'UPDATE users SET BirthDate = '+ getDateRefinedField('BirthDate');
  moveTable('users', ['ID', 'NationalID', 'FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Gender', 'RegisterTime', 'Description'],
                     ['ID', 'ID', 'FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Man', 'RegisterDate', 'Description']);

  qImport.SQL.Text := 'SELECT Pictures.* FROM Pictures INNER JOIN Users ON Pictures.ID = Users.ID';
  qImport.Open;
  myCommand.SQL.Text := 'INSERT INTO pictures (ID, Kind, Picture) VALUES (:ID, "user", :Picture)';
  for i := 1 to qImport.RecordCount do
  begin
    myCommand.ParamValues['ID'] := qImport.FieldByName('ID').AsInteger;
    myCommand.ParamValues['Picture'] := qImport.FieldByName('Picture').AsVariant;
    myCommand.Execute;
    qImport.Next;
  end;
}
{
//matches
  // init
  myQuery.SQL.Text := 'SELECT * FROM ageclasses ORDER BY ID';
  myQuery.Open;
  tmp := '';
  for i := 1 to myQuery.RecordCount do
  begin
    tmp := tmp + 'IIF(Age >= '+ myQuery.FieldByName('BeginAge').AsString +' AND Age <= '+ myQuery.FieldByName('EndAge').AsString + ', '+ myQuery.FieldByName('ID').AsString + ', ';
    if i = myQuery.RecordCount then tmp := tmp + 'NULL';
    myQuery.Next;
  end;
  for i := 1 to myQuery.RecordCount do tmp := tmp + ')';
  myQuery.SQL.Text := 'SELECT * FROM categories ORDER BY ID';
  myQuery.Open;
  tmp2 := '';
  for i := 1 to myQuery.RecordCount do
  begin
    tmp2 := tmp2 + 'IIF(Caption = "'+ myQuery.FieldByName('Title').AsString + '", '+ myQuery.FieldByName('ID').AsString + ', ';
    if i = myQuery.RecordCount then tmp2 := tmp2 + 'NULL';
    myQuery.Next;
  end;
  for i := 1 to myQuery.RecordCount do tmp2 := tmp2 + ')';

  // insert
  qImport.SQL.Text := 'SELECT Matches.*, Caption, '+ tmp +' AS AgeClass, '+ tmp2 +' AS Category, Picture FROM (Matches LEFT JOIN Groups ON Matches.GroupID = Groups.ID) LEFT JOIN Pictures ON Matches.ID = Pictures.ID ORDER BY Matches.ID';
  qImport.Open;
  qImportTmp.SQL.Text := 'SELECT * FROM Questions INNER JOIN Matches ON Questions.MatchID = Matches.ID ORDER BY MatchID';
  qImportTmp.Open;
  myCommandTmp.SQL.Text := 'INSERT INTO questions (MatchID, ID, Question, Answer) VALUES (:MatchID, :ID, :Question, :Answer)';

  for i := 1 to qImport.RecordCount do
  begin
    resource := (qImport.FieldByName('ID').AsInteger div 10000 = 31) or (qImport.FieldByName('ID').AsInteger div 10000 = 34);
    if resource then
    begin
      authorId := fMain.insertGlobalVar(qImport.FieldByName('Author').AsString, 'authors');
      publicationId := fMain.insertGlobalVar(qImport.FieldByName('Publication').AsString, 'publications');

      myCommand.SQL.Text := 'INSERT INTO resources (CreatorID, AuthorID, PublicationID, Kind, Title, AgeClass, EntityID) VALUES (:CreatorID, :AuthorID, :PublicationID, :Kind, :Title, :AgeClass, -1)';
      myCommand.ParamValues['CreatorID'] := getRefined(qImport.FieldByName('DesignerID').AsVariant);
      myCommand.ParamValues['Title'] := qImport.FieldByName('Title').AsString;
      myCommand.ParamValues['AgeClass'] := qImport.FieldByName('AgeClass').AsVariant;
      if qImport.FieldByName('ID').AsInteger div 10000 = 31 then myCommand.ParamValues['Kind'] := ResourceToString(rBook) else myCommand.ParamValues['Kind'] := ResourceToString(rMultiMedia);

      if authorId <> -1 then myCommand.ParamValues['AuthorID'] := authorId else myCommand.ParamValues['AuthorID'] := null;
      if publicationId <> -1 then myCommand.ParamValues['PublicationID'] := publicationId else myCommand.ParamValues['PublicationID'] := null;
      myCommand.Execute;
    end;

    myCommand.SQL.Text := 'INSERT INTO matches (DesignerID, Title, AgeClass, ResourceID, CategoryID, Content, Configuration) VALUES (:DesignerID, :Title, :AgeClass, :ResourceID, :CategoryID, :Content, :Configuration)';
    myCommand.ParamValues['DesignerID'] := getRefined(qImport.FieldByName('DesignerID').AsVariant);
    myCommand.ParamValues['Title'] := qImport.FieldByName('Title').AsString;
    myCommand.ParamValues['AgeClass'] := qImport.FieldByName('AgeClass').AsVariant;
    if resource then myCommand.ParamValues['ResourceID'] := myCommand.InsertId else myCommand.ParamValues['ResourceID'] := null;
    myCommand.ParamValues['CategoryID'] := qImport.FieldByName('Category').AsVariant;
    myCommand.ParamValues['Configuration'] := qImport.FieldByName('PictureConfiguration').AsString;
    myCommand.ParamValues['Content'] := qImport.FieldByName('Content').AsString;
    myCommand.Execute;
    matchId := myCommand.InsertId;

    questionId := 0;
    while (not qImportTmp.Eof) and (qImport.FieldByName('ID').AsInteger = qImportTmp.FieldByName('MatchID').AsInteger) do
    begin
      inc(questionId);
      myCommandTmp.ParamValues['MatchID'] := matchId;
      myCommandTmp.ParamValues['ID'] := questionId;
      myCommandTmp.ParamValues['Question'] := qImportTmp.FieldByName('Question').AsString;
      myCommandTmp.ParamValues['Answer'] := qImportTmp.FieldByName('Answer').AsString;
      qImportTmp.Next;
      myCommandTmp.Execute;
    end;

    if qImport.FieldByName('Picture').AsString <> '' then
    begin
      myCommand.SQL.Text := 'INSERT INTO pictures (ID, Kind, Picture) VALUES (:ID, "match", :Picture)';
      myCommand.ParamValues['ID'] := matchId;
      myCommand.ParamValues['Picture'] := qImport.FieldByName('Picture').AsVariant;
      myCommand.Execute;
    end;

    myCommand.SQL.Text := 'INSERT INTO supports (TournamentID, MatchID, CorrectorID, CurrentState) VALUES (1, :MatchID, :CorrectorID, :CurrentState)';
    myCommand.ParamValues['MatchID'] := matchId;
    myCommand.ParamValues['CurrentState'] := StateToString(TMatchState(qImport.FieldByName('State').AsInteger));
    myCommand.ParamValues['CorrectorID'] := getRefined(qImport.FieldByName('DesignerID').AsVariant);
    myCommand.Execute;

    qImport.Next;
  end;
}


{
  moveTable('Messages', ['ID'], ['SourceID', 'DestinationID', 'Content', 'SendDate', 'Viewed']);
  moveTable('Payments', ['ID'], ['UserID', 'Score', 'ScoreDate', 'OperatorID']);

// freescores
  moveTable('FreeScores', ['ID'], ['UserID', 'GroupID', 'Title', 'Score', 'ScoreDate', 'OperatorID']);
  myCommand.SQL.Text := 'UPDATE freescores SET GroupID = 1';
  myCommand.Execute;

// transactions
  moveTable('Transactions', ['UserID', 'MatchID'], ['DeliverDate', 'ReceiveDate', 'ScoreDate', 'Score', 'OperatorID']);
  qTmpImport.SQL.Text := 'SELECT UserID, Matches.ID AS MatchID, IIf(Abs(DeltaAge)>=3,IIf(DeltaAge>0, 1.5*Score, 0.5*Score), IIf(Abs(DeltaAge)<2, Score, IIf(DeltaAge>0, 1.25, 0.75) * Score)) AS RealScore, ' + 'Age - CInt(Left(ScoreDate,4))+CInt(Left(BirthDate,4)) AS DeltaAge, IIF(MaxScore <> 0, Round(Score/MaxScore,1), NULL) AS Quality, OperatorID, Man '+
                         'FROM (Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID) INNER JOIN Users ON Transactions.UserID = Users.ID WHERE Transactions.ScoreDate IS NOT NULL AND IsNumeric(Left(BirthDate,4))';
  qTmpImport.Open;
  myCommand.SQL.Text := 'UPDATE transactions SET Rate = :Rate, Score = :Score WHERE UserID = :UserID AND MatchID = :MatchID';
  for i := 1 to qTmpImport.RecordCount do
  begin
    myCommand.ParamValues['UserID'] := qTmpImport.FieldByName('UserID').AsString;
    myCommand.ParamValues['MatchID'] := qTmpImport.FieldByName('MatchID').AsString;
    myCommand.ParamValues['Rate'] := qTmpImport.FieldByName('Quality').AsString;
    myCommand.ParamValues['Score'] := qTmpImport.FieldByName('RealScore').AsString;
    myCommand.Execute;
    qTmpImport.Next;
  end;
}

{// sentences
  qTmpImport.SQL.Text := 'SELECT * FROM Sentences';
  qTmpImport.Open;
  myGlobalCommand.SQL.Text := 'INSERT INTO sentences (Sentence, ChangeDate) VALUES (:Sentence, "'+ getShamsiDate +'")';
  for i := 1 to qTmpImport.RecordCount do
  begin
    myGlobalCommand.ParamValues['Sentence'] := qTmpImport.FieldByName('Sentence').AsString + '  ' + qTmpImport.FieldByName('Person').AsString;
    myGlobalCommand.Execute;
    qTmpImport.Next;
  end;
}
end;
end;

procedure TfOptions.AdvGlowButton1Click(Sender: TObject);
begin
  fMain.qTmp.SQL.Text := 'SELECT ID FROM Groups WHERE Caption = "'+ fMain.correctString(eCaption.Text) +'"';
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount = 0 then
  begin
    fMain.qTmp.SQL.Text := 'SELECT Max(ID)+1 AS MaxOfID FROM Groups WHERE Kind = 0';
    fMain.qTmp.Open;
    fMain.executeCommand('INSERT INTO Groups(Kind, ID, Caption) VALUES (0, '+ fMain.qTmp.FieldByName('MaxOfID').AsString +', "'+ fMain.correctString(eCaption.Text) +'")');
    eCaption.Text := '';

    qGroup.Close;
    qGroup.Open;
  end else fMain.MyShowMessage('زیر گروهی با این عنوان قبلا ثبت شده است');
end;

procedure TfOptions.ReplaceInTable(tname : string);
var
  i : integer;
begin
  aqTable.TableName := tname;
  aqTable.Open;

  while not aqTable.Eof do
  begin
    aqTable.Edit;
    for i := 0 to aqTable.FieldCount - 1 do
      if not aqTable.Fields[i].ReadOnly then
        aqTable.Fields[i].AsString := fMain.correctString(aqTable.Fields[i].AsString);
    aqTable.Next;
  end;
  aqTable.Close;
end;

procedure TfOptions.bReplaceClick(Sender: TObject);
var i : integer;
  names : array[0..20] of string;
begin
  names[0] := 'FreeScores';
  names[1] := 'Groups';
  names[2] := 'Library';
  names[3] := 'Matches';
  names[4] := 'Messages';
  names[5] := 'Questions';
  names[6] := 'Sentences';
  names[7] := 'Users';

  fMain.ProgressBegin('اصلاح حرفی جدولها', 8);
  for i := 0 to 7 do
  begin
    ReplaceInTable(names[i]);
    fMain.ProgressContinue;
  end;
  fMain.ProgressEnd;
end;

procedure TfOptions.AdvGlowButton2Click(Sender: TObject);
var
  filename : string;
  tmpBitmap : TBitmap;
begin
{
  tmpBitmap := TBitmap.Create;
  aqTable.TableName := 'Users';
  aqTable.Open;
  filename := ExtractFileDir(Application.ExeName)+'/a.bmp';

  fMain.ProgressBegin('اصلاح اندازه‌ی تصاویر اعضا');
  fMain.ProgressInc := 100.0 / aqTable.RecordCount;
  while not aqTable.Eof do
  begin
    if aqTable.FieldByName('Picture').AsString <> '' then
    begin
      TBlobField(aqTable.FieldByName('Picture')).SaveToFile(filename);
      tmpBitmap.LoadFromFile(filename);
      if (tmpBitmap.Height <> 72) or (tmpBitmap.Width <> 54) then
      begin
        fMain.ScaleBmp(tmpBitmap);
        tmpBitmap.SaveToFile(filename);
        aqTable.Edit;
        TBlobField(aqTable.FieldByName('Picture')).LoadFromFile(filename);
        aqTable.Post;
      end;
      fMain.ProgressContinue;
    end;
    aqTable.Next;
  end;

  DeleteFile(filename);
  aqTable.Close;
  fMain.ProgressEnd;
}
end;

procedure TfOptions.bApplyClick(Sender: TObject);
var clientTmp : boolean; i : integer;
begin
  with fMain do
  begin
    clientTmp := isClient;
    options.Values['ServerAddress'] := eServerAddress.Text;
    WriteOptions;

    ReadOptions(clientTmp);

    executeCommand('UPDATE Library SET Title = "'+ correctString(eTitle.Text) + '"');
    if imgChange then fMain.InsertOrUpdateJpeg('0', 'library', iLibrary);

    options.Values['AutoConnectLibrary'] := BoolToStr(chAutoConnectLibrary.Checked);
    options.Values['DownGrade'] := BoolToStr(chDownGrade.Checked);
    options.Values['Paper'] := cbPaper.Text;
    options.Values['Printer'] := IntToStr(cbPrinter.ItemIndex);

    WriteOptions(clientTmp, eServerAddress.Text);
    ReadOptions(false, false, true);

    P_Temp.Visible := True;
  end;
end;

procedure TfOptions.AdvGlowButton4Click(Sender: TObject);
var
  S1, S2, TempS : string;
begin
  try
    TempS := LicenceToShamsi(S1, S2, eLicence.Text, getComputerID);
    Label7.Caption := 'تاریخ اعتبار : از ' + S1 + ' تا : ' + S2;
    Valid := True;
    if TempS = '1300/00/00' then Valid := False;
  except on E: Exception do
  begin
    Valid := False;
  end;
  end;

  if not Valid then Label7.Caption := 'این مجوز اعتبار ندارد';
end;

procedure TfOptions.AdvGlowButton5Click(Sender: TObject);
var
  i : integer;
begin
  AdvGlowButton4.Click;
  if Valid then
  begin
    with fMain do
    begin
      fMain.executeCommand('UPDATE library SET ServerID = "'+ eComputerId.Text +'", Licence = "'+ eLicence.Text +'"');
      fMain.MyShowMessage( 'مجوز وارد شده ثبت شد' );

      if LicenceCheck then
      begin
        ELAdmin;
        {x
        if fMain.qTmp.RecordCount = 1 then
        begin
          ME_Login.Text := '5111';
          PassWordEdit.Text := '1';
          fMain.MyShowMessage('برای امنیت نرم افزار، اطلاعات شخصی کد 5111 و کلمه عبور آن را تغییر دهید');
          nUserClick(nil);
          fUser.RG_ML.ItemIndex := 0;
          fUser.MaskEdit1.Text := '5111';
          fUser.loadUserFromMatch;
          fUser.bLogin.Click;
        end;
        }
      end;
    end;
  end else fMain.MyShowMessage( 'ثبت این مجوز مقدور نیست' );
end;

procedure TfOptions.AdvGlowButton7Click(Sender: TObject);
var
  i : Integer;
begin
{
  fMain.aqTemp.SQL.Text := 'SELECT * FROM aPaintWork WHERE Picture Is Not Null';
  fMain.aqTemp.Open;
  for i := 1 to fMain.aqTemp.RecordCount do
  begin
    TBlobField(fMain.aqTemp.FieldByName('Picture')).SaveToFile(fMain.sendFolderAddress + fMain.aqTemp.FieldByName('Match ID').AsString + '.bmp');
    fMain.aqTemp.Next;
  end;

  fMain.aqTemp.SQL.Text := 'SELECT * FROM aUsers WHERE Picture Is Not Null';
  fMain.aqTemp.Open;
  for i := 1 to fMain.aqTemp.RecordCount do
  begin
    TBlobField(fMain.aqTemp.FieldByName('Picture')).SaveToFile(fMain.sendFolderAddress + fMain.aqTemp.FieldByName('ID').AsString + '.bmp');
    fMain.aqTemp.Next;
  end;
}
end;

procedure TfOptions.AdvGlowButton8Click(Sender: TObject);
begin
  if fMain.sdJPEG.Execute then
     iLibrary.Picture.SaveToFile(fMain.AddExtension(fMain.sdJPEG.FileName, '.jpg'));
end;

procedure TfOptions.chServerClick(Sender: TObject);
begin
  if chServer.Checked then
  begin
    eServerAddressRightButtonClick(nil);
  end else
  begin
    eServerAddress.Enabled := false;
    eServerAddress.Text := '';
    fMain.options.Values['ServerAddress'] := eServerAddress.Text;
    fMain.WriteOptions;
    fMain.nOptionsClick(nil);
  end;
end;

procedure TfOptions.eComputerIdClick(Sender: TObject);
begin
  eComputerId.SelectAll;
end;

procedure TfOptions.eLicenceClick(Sender: TObject);
begin
  eLicence.SelectAll;
end;

procedure TfOptions.eServerAddressRightButtonClick(Sender: TObject);
var ok : boolean;
begin
  ok := false;
  if fMain.odReghaabat.Execute then
    if FileExists(ExtractFileDir(fMain.odReghaabat.FileName)+'\op') then
    begin
      ok := true;
      eServerAddress.Enabled := true;
      eServerAddress.Text := fMain.odReghaabat.FileName;
      fMain.options.Values['ServerAddress'] := eServerAddress.Text;
      fMain.WriteOptions;
      fMain.nOptionsClick(nil);
    end;
  chServer.Checked := ok;
  if not ok then fMain.MyShowMessage('فایل انتخاب شده معتبر نیست');
end;

procedure TfOptions.FormCreate(Sender: TObject);
var printer:TPrinter;
begin
  AdvOfficePager2.ActivePageIndex := 0;

  printer:= TPrinter.Create;
  cbPrinter.Items.Clear;
  cbPrinter.Items := printer.Printers;
end;

procedure TfOptions.SpeedButton1Click(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      iLibrary.Picture.LoadFromFile(fMain.odJPEG.FileName);
      if (iLibrary.Picture.Width <> 300) or (iLibrary.Picture.Height <> 300) then
      begin
        iLibrary.Picture := nil;
        fMain.MyShowMessage('لطفا تصویر را به ابعاد نوشته شده تبدیل کنید');
      end;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfOptions.SpeedButton2Click(Sender: TObject);
begin
  iLibrary.Picture := nil;
  imgChange := true;
end;

end.
