unit UnitOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Buttons,
  ExtCtrls, Mask, AdvSpin, AdvGroupBox, AdvPanel, AdvGlowButton, AdvAppStyler,
  DBCtrls, ExtDlgs, AdvOfficePager, AdvOfficeButtons, UnitMaster, DBTables,
  AdvProgressBar, jpeg, ComObj, Spin, AdvCGrid, Printers, MemDS, DBAccess,
  MyAccess;

type
  TfOptions = class(TMaster)
    AdvPanel2: TAdvPanel;
    AdvGlowButton3: TAdvGlowButton;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvOfficePager2: TAdvOfficePager;
    advfcpg2: TAdvOfficePage;
    AdvGroupBox3: TAdvGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AdvOfficePage1: TAdvOfficePage;
    AdvGroupBox4: TAdvGroupBox;
    Label6: TLabel;
    E_Title: TEdit;
    AdvGroupBox5: TAdvGroupBox;
    Image1: TImage;
    SpeedButton1: TAdvGlowButton;
    SpeedButton2: TAdvGlowButton;
    LicenseOfficePage: TAdvOfficePage;
    AdvGroupBox6: TAdvGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
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
    AdvGroupBox14: TAdvGroupBox;
    aqTable: TADOTable;
    Label9: TLabel;
    Label10: TLabel;
    AdvGlowButton6: TAdvGlowButton;
    AdvGlowButton8: TAdvGlowButton;
    AdvPanel1: TAdvPanel;
    Label7: TLabel;
    AdvGlowButton5: TAdvGlowButton;
    dsGroup: TDataSource;
    SpinEdit1: TAdvSpinEdit;
    SpinEdit2: TAdvSpinEdit;
    SpinEdit3: TAdvSpinEdit;
    SpinEdit4: TAdvSpinEdit;
    AdvGlowButton1: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    Label11: TLabel;
    chServer: TAdvOfficeCheckBox;
    eServerAddress: TButtonedEdit;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton7: TAdvGlowButton;
    AdvGlowButton9: TAdvGlowButton;
    AdvGroupBox7: TAdvGroupBox;
    Label13: TLabel;
    SE_ChildAge: TAdvSpinEdit;
    cbPaper: TComboBox;
    Label5: TLabel;
    Label8: TLabel;
    ME_MatchDate: TMaskEdit;
    chDownGrade: TAdvOfficeCheckBox;
    CH_AutoConnectLibrary: TAdvOfficeCheckBox;
    AdvGroupBox2: TAdvGroupBox;
    gLevel: TAdvColumnGrid;
    cbPrinter: TComboBox;
    Label14: TLabel;
    qGroup: TMyQuery;
    AdvGlowButton11: TAdvGlowButton;
    T_CheckBoxLibrary: TAdvOfficeCheckBox;
    procedure edt1Click(Sender: TObject);
    procedure edt2Click(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bReplaceClick(Sender: TObject);
    procedure ReplaceInTable( tname : string );
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton6Click(Sender: TObject);
    procedure AdvGlowButton7Click(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure AdvGlowButton9Click(Sender: TObject);
    procedure eServerAddressRightButtonClick(Sender: TObject);
    procedure chServerClick(Sender: TObject);
    procedure gLevelEditingDone(Sender: TObject);
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

uses UnitMain, UnitNewUser, uCryptography;

{$R *.dfm}

procedure moveTable(tableName : string; keyFields, syncFields : array of string);
var keyMySQL, keyAccess, keyQ, fieldString, cmd : string; i, j, fieldCount, keyCount : integer;

procedure initVars();
var j : integer;
begin
  keyCount := Length(keyFields) - 1;
  if keyCount = 0 then
  begin
    keyQ := '';
    keyMySQL := keyFields[0];
    keyAccess := keyFields[0];
  end else
  begin
    keyQ := '"';
    keyMySQL := 'CONCAT('; keyAccess := '';
    for j := 0 to keyCount do
    begin
      keyMySQL := keyMySQL + keyFields[j];
      keyAccess := keyAccess + 'Trim(Str('+ keyFields[j] +'))';
      if j <> keyCount then
      begin
        keyMySQL := keyMySQL + ',"-",';
        keyAccess := keyAccess + '+"-"+';
      end;
    end;
    keyMySQL := keyMySQL + ')';
  end;
  fieldCount := Length(syncFields) - 1; fieldString := '';
  for j := 0 to keyCount do fieldString := fieldString + keyFields[j] + ',';
  for j := 0 to fieldCount do
  begin
    fieldString := fieldString + syncFields[j];
    if j <> fieldCount then fieldString := fieldString + ',';
  end;
end;

procedure loopTempUp();
var i, j : integer;
begin
with fMain do
begin
  for i := 1 to qTmpImport.RecordCount do
  begin
    for j := 0 to keyCount do myCommand.ParamValues[keyFields[j]] := qTmpImport.Fields[j].AsVariant;
    for j := 0 to fieldCount do myCommand.ParamValues[syncFields[j]] := qTmpImport.Fields[j+keyCount+1].AsVariant;
    try
      myCommand.Execute;
    except on E: Exception do
      MyShowMessage(tableName + '->' + qTmpImport.Fields[0].AsString);
    end;
    qTmpImport.Next;
  end;
end;
end;

begin
  initVars;

with fMain do
begin
  cmd := 'INSERT INTO '+ tableName +' ('+ fieldString + ') VALUES (';
  for j := 0 to keyCount do cmd := cmd +':'+ keyFields[j] +',';
  for j := 0 to fieldCount do
  begin
    cmd := cmd +':'+ syncFields[j];
    if j <> fieldCount then cmd := cmd + ',';
  end;
  myCommand.SQL.Text := cmd + ');';

  qTmpImport.SQL.Text := 'SELECT '+ fieldString +' FROM '+ tableName;
  qTmpImport.Open;
  if qTmpImport.RecordCount > 0 then loopTempUp;
end;
end;

procedure TfOptions.AdvGlowButton11Click(Sender: TObject);
var i, matchID, questionID, entityID : integer;  tmp : string; resource : boolean;
begin
with fMain do
begin
  cImport.Close;
  cImport.ConnectionString:= AddressToConnectionString('ForConvert.mdb');
  cImport.Open;
  moveTable('Pictures', ['ID'], ['Picture']);
{
  moveTable('Messages', ['ID'], ['SourceID', 'DestinationID', 'Content', 'SendDate', 'Viewed']);
  moveTable('Payments', ['ID'], ['UserID', 'Score', 'ScoreDate', 'OperatorID']);
  moveTable('Users', ['ID'], ['FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Man', 'RegisterDate', 'Description']);

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
//matches
  myQuery.SQL.Text := 'SELECT * FROM categories ORDER BY ID';
  myQuery.Open;
  tmp := '';
  for i := 1 to myQuery.RecordCount do
  begin
    tmp := tmp + 'IIF(Age >= '+ myQuery.FieldByName('BeginAge').AsString +' AND Age <= '+ myQuery.FieldByName('EndAge').AsString + ', '+ myQuery.FieldByName('ID').AsString + ', ';
    if i = myQuery.RecordCount then tmp := tmp + 'NULL';
    myQuery.Next;
  end;
  for i := 1 to myQuery.RecordCount do tmp := tmp + ')';

  moveTable('Matches', ['ID'], ['State', 'QPPaper', 'Content']);
  qTmpImport.SQL.Text := 'SELECT Matches.*, Caption, '+ tmp +' AS Category FROM Matches LEFT JOIN Groups ON Matches.GroupID = Groups.ID';
  qTmpImport.Open;
  for i := 1 to qTmpImport.RecordCount do
  begin
    myCommand.SQL.Text := 'INSERT INTO entities (Title, Tags, Category) VALUES (:Title, :Tags, :Category);';
    myCommand.ParamValues['Title'] := qTmpImport.FieldByName('Title').AsString;
    myCommand.ParamValues['Tags'] := qTmpImport.FieldByName('Caption').AsString;
    myCommand.ParamValues['Category'] := qTmpImport.FieldByName('Category').AsVariant;
    myCommand.Execute;
    entityID := myCommand.InsertId;

    resource := (qTmpImport.FieldByName('ID').AsInteger div 10000 = 31) or (qTmpImport.FieldByName('ID').AsInteger div 10000 = 34);
    if resource then
    begin
      myCommand.SQL.Text := 'INSERT INTO resources (EntityID, Author, Publication) VALUES (:EntityID, :Author, :Publication);';
      myCommand.ParamValues['EntityID'] := entityID;
      myCommand.ParamValues['Author'] := qTmpImport.FieldByName('Author').AsString;
      myCommand.ParamValues['Publication'] := qTmpImport.FieldByName('Publication').AsString;
      myCommand.Execute;
    end;

    myCommand.SQL.Text := 'UPDATE matches SET ResourceID = :ResourceID, EntityID = :EntityID, CorrectorID = :DesignerID, LibraryResourceID = :LibraryBookID, Configuration = :PictureConfiguration WHERE ID = :ID;';
    myCommand.ParamValues['ID'] := qTmpImport.FieldByName('ID').AsVariant;
    if resource then myCommand.ParamValues['ResourceID'] := myCommand.InsertId;
    myCommand.ParamValues['EntityID'] := entityID;
    myCommand.ParamValues['DesignerID'] := qTmpImport.FieldByName('DesignerID').AsVariant;
    myCommand.ParamValues['LibraryBookID'] := qTmpImport.FieldByName('LibraryBookID').AsString;
    myCommand.ParamValues['PictureConfiguration'] := qTmpImport.FieldByName('PictureConfiguration').AsString;
    myCommand.Execute;
    qTmpImport.Next;
  end;
  myCommand.SQL.Text := 'UPDATE pictures, matches SET pictures.ID = matches.EntityID WHERE pictures.ID = matches.ID';
  myCommand.Execute;

// questions
  executeCommand('ALTER TABLE questions CHANGE ID ID INT(11) NOT NULL;');
  moveTable('Questions', ['MatchID', 'ID'], ['Question', 'Answer']);

  matchID := 0;
  qTmp.SQL.Text := 'SELECT MatchID, ID FROM Questions ORDER BY MatchID, ID';
  qTmp.Open;
  myCommand.SQL.Text := 'UPDATE questions SET ID = :questionID WHERE MatchID = :MatchID AND ID = :ID';
  for i := 1 to qTmp.RecordCount do
  begin
    if matchID <> qTmp.Fields[0].AsInteger then
    begin
      questionID := 0;
      matchID := qTmp.Fields[0].AsInteger;
      myCommand.ParamValues['MatchID'] := matchID;
    end;
    inc(questionID);
    myCommand.ParamValues['questionID'] := questionID;
    myCommand.ParamValues['ID'] := qTmp.Fields[1].AsInteger;
    myCommand.Execute;
    qTmp.Next;
  end;
  executeCommand('ALTER TABLE questions CHANGE ID ID TINYINT(4) NOT NULL;');

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

procedure TfOptions.AdvGlowButton3Click(Sender: TObject);
var clientTmp : boolean; i : integer;
begin
  clientTmp := fMain.isClient;
  fMain.options.Values['ServerAddress'] := eServerAddress.Text;
  fMain.WriteOptions;

  fMain.ReadOptions(clientTmp);
  if (ME_MatchDate.Text <> '    /  /  ') and (ME_MatchDate.Text <> fMain.options.Values['BeginDate']) then
  begin
    fMain.MyShowMessage( 'مسابقات جدید از تاریخ ' + ME_MatchDate.Text + ' برگزار می‌شود' );
    fMain.options.Values['BeginDate'] := ME_MatchDate.Text;
  end;

  fMain.executeCommand('UPDATE Library SET Title = "'+ fMain.correctString(E_Title.Text) + '"');
  if imgChange then fMain.InsertOrUpdateJpeg('0', 'library', Image1);

  fMain.options.Values['AutoConnectLibrary'] := BoolToStr(CH_AutoConnectLibrary.Checked);
  fMain.options.Values['DownGrade'] := BoolToStr(chDownGrade.Checked);
  fMain.options.Values['CBookMatch'] := SpinEdit1.Text;
  fMain.options.Values['CCDMatch'] := SpinEdit2.Text;
  fMain.options.Values['CWorkMatch'] := SpinEdit3.Text;
  fMain.options.Values['CPaintMatch'] := SpinEdit4.Text;
  fMain.options.Values['ChildAge'] := SE_ChildAge.Text;
  fMain.options.Values['Paper'] := cbPaper.Text;
  fMain.options.Values['Printer'] := IntToStr(cbPrinter.ItemIndex);

  for i := 1 to gLevel.RowCount do
    if gLevel.Cells[1,i] <> '' then
    begin
      fMain.options.Values['LvMin' + IntToStr(i)] := gLevel.Cells[2,i];
      fMain.options.Values['LvMax' + IntToStr(i)] := gLevel.Cells[3,i];
    end;

  fMain.WriteOptions(clientTmp, eServerAddress.Text);
  fMain.ReadOptions(false, false, true);

  fMain.L_MatchDate.Caption := ME_MatchDate.Text;
  fMain.P_Temp.Visible := True;
end;

procedure TfOptions.AdvGlowButton4Click(Sender: TObject);
var
  S1, S2, TempS : string;
begin
  try
    TempS := LicenceToShamsi(S1, S2, edt2.Text, getComputerID);
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
      fMain.executeCommand('UPDATE library SET ServerID = "'+ edt1.Text +'", Licence = "'+ edt2.Text +'"');
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

procedure TfOptions.AdvGlowButton6Click(Sender: TObject);
var v: OLEvariant; DBa, matchAddress : string;
begin
  if fMain.isClient then matchAddress := 'MatchClientAddress' else matchAddress := 'MatchAddress';

  fMain.cMatch.Close;
  DBa := fMain.options.Values[matchAddress];
  try
    v := CreateOLEObject('JRO.JetEngine');
    try
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=abrdmkazhdpkzsrst;Data Source=' + DBa,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=abrdmkazhdpkzsrst;Data Source=' + DBa + 'x;Jet OLEDB:Engine type=5');
      DeleteFile(DBa);
      RenameFile(DBa + 'x', DBa)
    finally
      v := Unassigned
    end;
  except on E: Exception do
    fMain.MyShowMessage(E.Message);
  end;
  fMain.nConnectMatch.Click;
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
     Image1.Picture.SaveToFile(fMain.AddExtension(fMain.sdJPEG.FileName, '.jpg'));
end;

procedure TfOptions.AdvGlowButton9Click(Sender: TObject);
var S, id : string; i : integer;
begin
{
  fMain.qTmp1.SQL.Text := '(SELECT ID FROM Users) UNION (SELECT ID FROM Matches)';
  fMain.qTmp1.Open;
  for I := 1 to fMain.qTmp1.RecordCount do
  begin
  id := fMain.qTmp1.Fields[0].AsString;
  S := 'D:\Flash\Project\Match\Match\Send\' + id + '.jpg';
  if FileExists(S) then
  begin
    fMain.qTmp.SQL.Text := 'SELECT * FROM Pictures'; fMain.qTmp.Open;
    fMain.qTmp.AppendRecord([id, nil]);
    fMain.qTmp.Edit;
    TBlobField(fMain.qTmp.FieldByName('Picture')).LoadFromFile(S);
    fMain.qTmp.Post;
    DeleteFile(S);
  end;
  fMain.qTmp1.Next;
  end;
}
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

procedure TfOptions.edt1Click(Sender: TObject);
begin
  edt1.SelectAll;
end;

procedure TfOptions.edt2Click(Sender: TObject);
begin
  edt2.SelectAll;
end;

procedure TfOptions.eServerAddressRightButtonClick(Sender: TObject);
var ok : boolean;
begin
  ok := false;
  if fMain.odReghaabat.Execute then
    if FileExists(ExtractFileDir(fMain.odReghaabat.FileName)+'\op.mpt') then
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
  gLevel.Options := gLevel.Options + [goEditing];

  printer:= TPrinter.Create;
  cbPrinter.Items.Clear;
  cbPrinter.Items := printer.Printers;
end;

procedure TfOptions.gLevelEditingDone(Sender: TObject);
var i : integer;
begin
  if gLevel.Row <> 1 then
    gLevel.Cells[3, gLevel.Row-1] := IntToStr(StrToInt(gLevel.Cells[2, gLevel.Row]) - 1);
  if gLevel.Row <> gLevel.RowCount then
    gLevel.Cells[2, gLevel.Row+1] := IntToStr(StrToInt(gLevel.Cells[3, gLevel.Row]) + 1);

  for i := 1 to gLevel.RowCount-1 do
  begin
    if StrToInt(gLevel.Cells[2, i]) > StrToInt(gLevel.Cells[3, i]) then
       gLevel.Cells[3, i] := gLevel.Cells[2, i];
    if i < gLevel.RowCount-1 then
      if StrToInt(gLevel.Cells[3, i]) >= StrToInt(gLevel.Cells[2, i+1]) then
        gLevel.Cells[2, i+1] := IntToStr(StrToInt(gLevel.Cells[3, i]) + 1);
  end;
end;

procedure TfOptions.SpeedButton1Click(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      Image1.Picture.LoadFromFile(fMain.odJPEG.FileName);
      if (Image1.Picture.Width <> 300) or (Image1.Picture.Height <> 300) then
      begin
        Image1.Picture := nil;
        fMain.MyShowMessage('لطفا تصویر را به ابعاد نوشته شده تبدیل کنید');
      end;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfOptions.SpeedButton2Click(Sender: TObject);
begin
  Image1.Picture := nil;
  imgChange := true;
end;

end.
