 unit UnitMain;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvPreviewMenu,
  AdvPreviewMenuStylers, AdvShapeButton, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvOfficePager, AdvOfficePagerStylers,
  AdvGlowButton, AdvGlassButton, StdCtrls, Mask, Buttons, ExtCtrls, Spin, Grids,
  BaseGrid, AdvGrid, DBAdvGrid, AdvGroupBox, AdvPanel, AdvAppStyler,
  Menus, AdvOfficeTabSetStylers, AdvMenus, AdvMenuStylers,
  ImgList, AdvOfficeHint, DB, ADODB, frxClass, frxDBSet, TaskDialog,
  TaskDialogEx, AdvOfficeImage, GDIPPictureContainer, AdvOfficeButtons, AdvCGrid,
  AdvSmoothButton, pngimage, AdvSmoothSplashScreen, AdvSmoothMessageDialog, jpeg,
  AdvProgressBar, AdvOfficeTabSet, ExtDlgs, Printers, DBAccess, MyAccess, MemDS, UnitTypes;

type
  TfMain = class(TAdvToolBarForm)
    tbs: TAdvToolBarOfficeStyler;
    pStatus: TAdvOfficeStatusBar;
    osbs: TAdvOfficeStatusBarOfficeStyler;
    ps: TAdvPanelStyler;
    P_User: TAdvPanel;
    apps: TAdvAppStyler;
    AdvToolBarPager: TAdvToolBarPager;
    AdvPage1: TAdvPage;
    AdvToolBar1: TAdvToolBar;
    AdvPage2: TAdvPage;
    AdvPage3: TAdvPage;
    AdvPage4: TAdvPage;
    AdvToolBar3: TAdvToolBar;
    ms: TAdvMenuOfficeStyler;
    pmScore: TAdvPopupMenu;
    M_UserMatchScore1: TMenuItem;
    M_UserMatchScore2: TMenuItem;
    M_UserMatchScore3: TMenuItem;
    N_T_Design: TAdvToolBar;
    nInstructionMatches: TAdvGlowButton;
    nQuestionMatches: TAdvGlowButton;
    nResources: TAdvGlowButton;
    nOptions: TAdvGlowButton;
    nSkin: TAdvGlowButton;
    pagers: TAdvOfficePagerOfficeStyler;
    otbs: TAdvOfficeTabSetOfficeStyler;
    fs: TAdvFormStyler;
    Label5: TLabel;
    ME_Code: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    LFamily: TLabel;
    Label9: TLabel;
    LAge: TLabel;
    LName: TLabel;
    B_Refresh: TAdvGlowButton;
    cLibrary: TADOConnection;
    cMatch: TADOConnection;
    pmMatchPath: TAdvPopupMenu;
    M_ConnectPathMatch: TMenuItem;
    pmLibraryPath: TAdvPopupMenu;
    M_ConnectPathLibrary: TMenuItem;
    odDatabase: TOpenDialog;
    AdvGroupBox1: TAdvGroupBox;
    L_MatchDate: TLabel;
    ICMatch: TImage;
    ICLibrary: TImage;
    fdPicture: TfrxDBDataset;
    fdMatch: TfrxDBDataset;
    fdUser: TfrxDBDataset;
    pmDesigner: TAdvPopupMenu;
    M_TarrahReport1: TMenuItem;
    M_TarrahReport2: TMenuItem;
    M_TarrahReport3: TMenuItem;
    P_MatchEdit: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    MaskEdit4: TMaskEdit;
    adoCommand: TADOCommand;
    Label10: TLabel;
    P_Temp: TAdvPanel;
    pmStyle: TAdvPopupMenu;
    thmBrown: TMenuItem;
    thmBlue: TMenuItem;
    thmSilver: TMenuItem;
    P_LS: TAdvGlowButton;
    L_LS: TLabel;
    cImport: TADOConnection;
    fdLibrary: TfrxDBDataset;
    Label1: TLabel;
    AdvToolBar5: TAdvToolBar;
    nLog: TAdvGlowButton;
    AdvToolBar4: TAdvToolBar;
    nChart: TAdvGlowButton;
    nTotalReport: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    nDesignerList: TAdvGlowButton;
    nScoreList: TAdvGlowButton;
    AdvToolBar8: TAdvToolBar;
    nConnectLibrary: TAdvGlowButton;
    nConnectMatch: TAdvGlowButton;
    nDeliver: TAdvGlowButton;
    nReceive: TAdvGlowButton;
    AdvToolBar10: TAdvToolBar;
    nMatchList: TAdvGlowButton;
    nSetScore: TAdvGlowButton;
    nDesigner: TAdvGlowButton;
    AdvToolBar9: TAdvToolBar;
    nImport: TAdvGlowButton;
    aqTemp: TADOQuery;
    nPay: TAdvGlowButton;
    AdvPage6: TAdvPage;
    AdvToolBar11: TAdvToolBar;
    nUpload: TAdvGlowButton;
    N_Sentence: TAdvGlowButton;
    nLabel: TAdvGlowButton;
    frxReport: TfrxReport;
    AdvToolBar12: TAdvToolBar;
    nAbout: TAdvGlowButton;
    P_SearchUser: TAdvPanel;
    GroupBox: TAdvGroupBox;
    gUser: TAdvColumnGrid;
    B_SearchUser: TAdvGlowButton;
    lLicense: TLabel;
    Label2: TLabel;
    LDescription: TLabel;
    BB_Modify: TAdvGlowButton;
    BB_Delete: TAdvGlowButton;
    SplashScreen: TAdvSmoothSplashScreen;
    ilMenu: TImageList;
    ilLogin: TImageList;
    msgDialog: TAdvSmoothMessageDialog;
    AdvShapeButton1: TAdvShapeButton;
    ilButton: TImageList;
    ilUser: TImageList;
    Picture: TImage;
    uPicture: TAdvGlowButton;
    ilButtonOff: TImageList;
    ilMenuOff: TImageList;
    AdvToolBar13: TAdvToolBar;
    nMessage: TAdvGlowButton;
    nUser: TAdvGlowButton;
    aqTemp2: TADOQuery;
    thmWhite: TMenuItem;
    ilEditButton: TImageList;
    msgProgress: TAdvSmoothMessageDialog;
    msgDelete: TAdvSmoothMessageDialog;
    fdList: TfrxDBDataset;
    lLogin: TLabel;
    bDeLogin: TAdvGlowButton;
    ilSmall: TImageList;
    qTmpLibrary: TADOQuery;
    odJPEG: TOpenPictureDialog;
    nFreeScore: TAdvGlowButton;
    sdJPEG: TSavePictureDialog;
    qTmpImport: TADOQuery;
    aqTemp4: TADOQuery;
    aqTemp3: TADOQuery;
    odReghaabat: TOpenDialog;
    iEditButtonOff: TImageList;
    pLogin: TAdvGroupBox;
    pInnerLogin: TAdvGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    PassWordEdit: TEdit;
    bLogin: TAdvGlowButton;
    ME_Login: TMaskEdit;
    cMyLocal: TMyConnection;
    myGlobalCommand: TMyCommand;
    bSync: TAdvGlowButton;
    myGlobalQuery: TMyQuery;
    myCommandTmp: TMyCommand;
    myCommand: TMyCommand;
    myQuery: TMyQuery;
    qTmp: TMyQuery;
    qTmp1: TMyQuery;
    qfLibrary: TMyQuery;
    qfList: TMyQuery;
    qfUser: TMyQuery;
    qfMatch: TMyQuery;
    qfPicture: TMyQuery;
    cMyGlobal: TMyConnection;
    myQueryTmp: TMyQuery;
    procedure B_SearchUserClick(Sender: TObject);
    procedure nUploadClick(Sender: TObject);
    procedure nAboutClick(Sender: TObject);
    procedure nLabelClick(Sender: TObject);
    procedure nPayClick(Sender: TObject);
    procedure nReceiveClick(Sender: TObject);
    procedure nDeliverClick(Sender: TObject);
    procedure nImportClick(Sender: TObject);
    procedure nOptionsClick(Sender: TObject);
    procedure N_SentenceClick(Sender: TObject);
    procedure nUserClick(Sender: TObject);
    procedure nChartClick(Sender: TObject);
    procedure nTotalReportClick(Sender: TObject);
    procedure nLogClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure nInstructionMatchesClick(Sender: TObject);
    procedure nQuestionMatchesClick(Sender: TObject);
    procedure nResourcesClick(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure nMatchListClick(Sender: TObject);
    procedure nFreeScoreClick(Sender: TObject);
    procedure nDesignerClick(Sender: TObject);
    procedure M_TarrahReport3Click(Sender: TObject);
    procedure M_TarrahReport2Click(Sender: TObject);
    procedure M_TarrahReport1Click(Sender: TObject);
    procedure M_UserMatchScore3Click(Sender: TObject);
    procedure M_UserMatchScore2Click(Sender: TObject);
    procedure M_UserMatchScore1Click(Sender: TObject);
    procedure ME_CodeClick(Sender: TObject);
    procedure B_RefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
    procedure PassWordEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ME_LoginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ME_CodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure nConnectLibraryClick(Sender: TObject);
    procedure nConnectMatchClick(Sender: TObject);
    procedure M_ConnectPathLibraryClick(Sender: TObject);
    procedure M_ConnectPathMatchClick(Sender: TObject);
    procedure nSetScoreClick(Sender: TObject);

    procedure presetMenu();
    procedure postsetMenu(title : string; form : TForm);
    procedure fillComboWithQuery(cb : TComboBox; isql : string);
    procedure showResourceForm();
    procedure showQuestionMatchForm();
    procedure showInstructionMatchForm();

    function isSuperUser() : boolean;
    function hasGenderPermission(gstr : string) : boolean;

    procedure ScaleBmp(bitmp: TBitmap);
    procedure thrImport();
    procedure ReadOptions(client : boolean = false; protect : boolean = false; first : boolean = false);
    procedure WriteOptions(client : boolean = false; writeAddress : string = '');
    procedure DeLogin();
    procedure Backup(filename : string);
    procedure LoadFastReport( FName : String );
    procedure ELUser(Cascade : Boolean);
    procedure ELOperator(Cascade : Boolean);
    procedure ELDesigner(Cascade : Boolean);
    procedure ELManager(Cascade : Boolean);
    procedure ELAdmin();
    procedure EAF( Low : Boolean );
    procedure GetUserMatchScore( F : Integer );
    procedure ShowDesignerList( I : Integer );
    procedure MyShowMessage(str : String; desktop : boolean = false);

    procedure MakeFastList(sql, titleText, footerText : string; lLength, rightAlign : integer; moveRight : integer = 0);
    procedure EncodeFile(filename : string);
    procedure DecodeFile(filename : string);
    procedure CopyMatchFromFileToDB( filename : string );
    function getNewMatchID(Kind : Byte): String;
    function AddExtension(filename, ext : string) : string;
    function LicenceCheck(Show : Boolean = true) : Boolean;
    function AddressToConnectionString( Address : String ) : String;
    procedure nMessageClick(Sender: TObject);
    procedure thmClick(Sender: TObject);
    procedure ProgressBegin(title : string; count : integer; close : boolean = true);
    procedure ProgressContinue();
    procedure ProgressEnd(failStr : string = '');
    procedure bDeLoginClick(Sender: TObject);
    procedure syncDatabase();

    function recordExists(sql : string) : boolean;
    procedure executeCommand(sql : String);
    function searchMatch( Str : String ) : Boolean;

    function loadJpeg(id, group : String; img: TImage; qry: TMyQuery) : Boolean;
    procedure InsertOrUpdateJpeg(id, kind : String; img : TImage);
    function InsertOrUpdate(table, condition: string; fields : array of string; values : array of Variant) : integer;

    function isClient() : boolean;
    function correctString(input : string) : string;
    function getShamsiDate() : String;
    function getNextToken (Const S: string; Separator: char; var StartPos: integer): String;
    function StrToMatchID(MaskEditText : String) : String;
    function MatchIDToStr(MatchID : String) : String;
    function sqlRealScores(UserID : String = ''; Group: Integer = 0) : String;
    function sqlUserScores(UserID : String = ''; Group: Integer = 0) : String;
    procedure P_TempResize(Sender: TObject);
    procedure bSyncClick(Sender: TObject);
  private
  protected
    { Protected declarations }
  public
    resourceAddress : string;
    loginUser : TUser;
    loginGender : TGender;
    loginUserID, userID : String;
    options : TStringList;

    cStates : array[0..2] of string;
    cMatches : array[0..5] of string;
    progressInc : Double; progressCounter, progressUnit : Integer;
    sendFolderAddress : string;
    listHeader, listField : array[0..100] of String;
    listWidth : array[0..100] of Integer;
  end;

var
  fMain: TfMain;
  LicenseCheckBool : Boolean;

implementation

uses UnitTDE, UnitSetScore, uCryptography,
  UnitTarrahReport, UnitResumeTahvil, UnitMatchReport, UnitDesignBC,
  UnitDesignWP, UnitLog, UnitTotalReport, UnitChart, UnitNewUser, AdvStyleIF,
  UnitOptions, UnitSentence, UnitExImport, UnitForm, UnitAbout, UnitWeb, UnitMessage,
  UFaDate, uShamsiDate, UnitReference;

{$R *.dfm}

function TfMain.sqlRealScores(UserID : String; Group: Integer) : String; // DeltaAge, UserID, MatchID, Score, OperatorID, Man, Quality, RealScore
var UserCondition, GroupCondition : String;
begin
  if UserID <> '' then UserCondition := 'UserID = ' + UserID + ' AND ';
  if Group <> 0 then GroupCondition := 'MatchID div 10000 = 3' + IntToStr(Group) + ' AND ';
  Result := '(SELECT tmp.*, IF(Abs(DeltaAge)>=3, IF(DeltaAge>0, 1.5*Score, 0.5*Score), IF(Abs(DeltaAge)<2, Score, IF(DeltaAge>0, 1.25, 0.75)*Score)) AS RealScore FROM '+
            '(SELECT Age - CONVERT(LEFT(ScoreDate,4), SIGNED) + CONVERT(LEFT(BirthDate,4), SIGNED) AS DeltaAge, UserID, Matches.ID AS MatchID, Score, OperatorID, Man, IF(MaxScore <> 0, Score/MaxScore, NULL) AS Quality FROM '+
            '(Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID) INNER JOIN Users ON Transactions.UserID = Users.ID WHERE '+ GroupCondition +  UserCondition + 'CONVERT(LEFT(BirthDate,4), SIGNED) IS NOT NULL AND ScoreDate >= "1380/01/01") as tmp) AS RealScores';
end ;

function TfMain.sqlUserScores(UserID : String; Group: Integer) : String; // ID, ScoreSum, ScoreCount, AvgQuality
var UserCondition, GroupCondition : String;
begin
  if UserID <> '' then UserCondition := 'UserID = ' + UserID + ' AND ';
  if (Group <> 0) and (Group <> 5) then GroupCondition := 'UserID IS NULL AND ';
  Result := '(SELECT Users.ID, Round(IFNULL(SumOfMatchScore,0)+IFNULL(SumOfFreeScore,0)) AS ScoreSum, IFNULL(CountOfMatchScore,0)+IFNULL(CountOfFreeScore,0) AS ScoreCount, ' + 'IF(AvgQuality IS NULL, " ", CONCAT(ROUND(AvgQuality*100),"%")) AS AvgQuality '+
            'FROM (Users LEFT JOIN '+
            '(SELECT UserID, Sum(RealScore) AS SumOfMatchScore, Count(RealScore) AS CountOfMatchScore, Avg(Quality) AS AvgQuality FROM '+ sqlRealScores(UserID, Group) +' GROUP BY UserID) AS UserMatchScores' +
            ' ON Users.ID = UserMatchScores.UserID) LEFT JOIN '+
            '(SELECT UserID, Sum(Score) AS SumOfFreeScore, Count(Score) AS CountOfFreeScore FROM FreeScores WHERE '+ GroupCondition + UserCondition +' ScoreDate >= "'+ options.Values['BeginDate'] +'" GROUP BY UserID) UserFreeScores' +
            ' ON Users.ID = UserFreeScores.UserID) AS UserScores';
end;

function TfMain.isSuperUser() : boolean;
begin
   Result := (loginUser = uAdmin) or (loginUser = uMaster);
end;
function TfMain.hasGenderPermission(gstr : string) : boolean;
begin
  Result := (isSuperUser) or (loginGender = StringToGender(gstr));
end;

function TfMain.isClient() : boolean;
begin
  Result := (options.Values['ServerAddress'] <> '');
end;
function TfMain.correctString(input : string) : string;
begin
  Result := StringReplace(input, #34, #39, [rfReplaceAll]);
  Result := StringReplace(Result, 'ي', 'ی', [rfReplaceAll]);
end;
function TfMain.getShamsiDate() : String;
begin
  Result := TFaDate.Create(Date).ToDateString;
end;
function TfMain.StrToMatchID(MaskEditText : String) : String;
begin
  Result := LeftStr(MaskEditText, 3) + RightStr(MaskEditText, 3);
end;
function TfMain.MatchIDToStr(MatchID : String) : String;
begin
  Result := LeftStr(MatchID, 3) + '-' + RightStr(MatchID, 3);
end;
procedure TfMain.executeCommand(sql : String);
begin
  myCommand.SQL.Text := sql;
  myCommand.Execute;
end;
function TfMain.recordExists(sql : string) : boolean;
begin
  myQuery.SQL.Text := sql;
  myQuery.Open;
  Result := (myQuery.RecordCount = 1);
end;
function TfMain.InsertOrUpdate(table, condition: string; fields : array of string; values : array of Variant) : integer; // -1: update, else : insertedId
var i, count : integer; sql, tmp : string;
begin
  count := Length(fields) - 1;

  myQuery.SQL.Text := 'SELECT * FROM '+ table + ' WHERE '+ condition;
  myQuery.Open;
  if myQuery.RecordCount = 1 then
  begin
    sql := 'UPDATE '+ table + ' SET ';
    for i := 0 to count do
    begin
      sql := sql + fields[i] + '=:' + fields[i];
      if i <> count then sql := sql + ', ';
    end;
    sql := sql + ' WHERE '+ condition;
    Result := -1;
  end else
  begin
    sql := 'INSERT INTO '+ table +' (';
    for i := 0 to count do
    begin
      sql := sql + fields[i];
      tmp := tmp + ':' + fields[i];
      if i <> count then
      begin
        sql := sql + ', ';
        tmp := tmp + ', ';
      end;
    end;
    sql := sql + ') VALUES ('+ tmp +')';
    Result := 0;
  end;
  myCommand.SQL.Text := sql;
  for i := 0 to count do
    myCommand.ParamValues[fields[i]] := values[i];
  myCommand.Execute;

  if Result = 0 then Result := myCommand.InsertId;
end;
procedure TfMain.InsertOrUpdateJpeg(id, kind : String; img : TImage);
var S : String; valid : boolean;
begin
  valid := false;
  if img.Picture <> nil then
  begin
    S := ExtractFileDir(Application.ExeName)+'\a.tmp';
    img.Picture.SaveToFile(S);
    valid := FileExists(S);
  end;

  myQuery.SQL.Text := 'SELECT * FROM pictures WHERE Kind = "'+ kind +'" AND ID = '+ id;
  myQuery.Open;
  if myQuery.RecordCount = 0 then
  begin
    myCommand.SQL.Text := 'INSERT INTO pictures (ID, Kind) VALUES ('+ id +', "'+ kind +'")';
    myCommand.Execute;
    myQuery.SQL.Text := 'SELECT * FROM pictures WHERE Kind = "'+ kind +'" AND ID = '+ id;
    myQuery.Open;
  end else
  if myQuery.RecordCount = 1 then
  begin
    if not valid then
      executeCommand('DELETE FROM Pictures WHERE ID = '+ id);
  end;

  if valid then
  begin
    myQuery.Edit;
    TBlobField(myQuery.FieldByName('Picture')).LoadFromFile(S);
    myQuery.Post;
    DeleteFile(S);
  end;
end;
procedure getJpeg(Image: TImage; Field: TField);
var
  Jpeg: TJpegImage;
  BS: TBlobStream;
begin
  if Field.AsString = '' then Image.Picture := nil else
  begin
    Jpeg := TJpegImage.Create;
    BS := TBlobStream.Create(TBlobField(Field),bmRead);
    Jpeg.LoadFromStream(BS);
    Image.Picture.Assign(Jpeg);
    BS.Free; Jpeg.Free;
  end;
end;
function TfMain.loadJpeg(id, group: string; img: TImage; qry: TMyQuery) : Boolean;
begin
  qry.SQL.Text := 'SELECT Picture FROM pictures WHERE Picture IS NOT NULL AND Kind = "'+ group +'" AND ID = ' + id;
  qry.Open;
  Result := true;
  if qry.RecordCount = 1 then
      getJpeg(img, qry.FieldByName('Picture'))
  else Result := false;
end;
function TfMain.getNextToken (Const S: string; Separator: char; var StartPos: integer): String;
var Index: integer;
begin
  Result := '';
  While (S[StartPos] = Separator) and (StartPos <= length(S)) do
    StartPos := StartPos + 1;
  if StartPos > length(S) then Exit;
  Index := StartPos;

  While (S[Index] <> Separator) and (Index <= length(S))do
    Index := Index + 1;
  Result := Copy(S, StartPos, Index - StartPos) ;
  StartPos := Index + 1;
end;

procedure TfMain.ProgressBegin(title : string; count : integer; close : boolean);
begin
  ProgressCounter := 0;

  if count < 20 then
  begin
    ProgressUnit := 1;
    ProgressInc := 100.0/count;
  end else
  begin
    ProgressUnit := Round(count/20.0); // 20 level
    ProgressInc := 5.0;
  end;

  msgProgress.AutoClose := close;
  msgProgress.Buttons[0].Enabled := true;
  msgProgress.Caption := title;
  msgProgress.ProgressValue := 0;
  msgProgress.ProgressVisible  := true;
  msgProgress.Execute;
end;

procedure TfMain.ProgressContinue();
begin
  Inc(ProgressCounter);
  if ProgressCounter mod ProgressUnit = ProgressUnit-1 then
    msgProgress.ProgressValue := msgProgress.ProgressValue + ProgressInc;
end;

procedure TfMain.ProgressEnd(failStr : string);
begin
  if failStr = '' then
  begin
    msgProgress.ProgressValue  := 100;
  end else
  begin
    msgProgress.Caption := failStr;
    msgProgress.ProgressVisible  := false;
  end;
  msgProgress.Buttons[0].Enabled := true;
end;

procedure TfMain.P_TempResize(Sender: TObject);
begin
  pInnerLogin.Left := Round((pLogin.Width - pInnerLogin.Width)/2.0);
  pInnerLogin.Top := Round((pLogin.Height - 1.5*AdvToolBarPager.Height)/2.0);
end;

procedure TfMain.ReadOptions(client : boolean; protect : boolean; first : boolean);
var filename, exen, serverTmp, matchTmp, libraryTmp, themeTmp : string; printer : TPrinter; tmp : integer;
begin
  if client then exen := options.Values['ServerAddress'] else exen := Application.ExeName;

  if protect then
  begin
    serverTmp := options.Values['ServerAddress'];
    matchTmp := options.Values['MatchAddress'];
    libraryTmp := options.Values['LibraryAddress'];
    themeTmp := options.Values['Theme'];
  end;

  filename := ExtractFileDir(exen)+'\op.mpt';
  if FileExists(filename) then
  begin
    DecodeFile(filename);
    options.LoadFromFile(filename);
    EncodeFile(filename);
  end;

  if isClient and first then
    ReadOptions(isClient, true, false)
  else
  begin
  if options.Values['AutoConnectLibrary'] = '' then options.Values['AutoConnectLibrary'] := BoolToStr(false);
  if options.Values['DownGrade'] = '' then options.Values['DownGrade'] := BoolToStr(true);

  if options.Values['BeginDate'] = '' then options.Values['BeginDate'] := '1380/01/01';
  if options.Values['CBookMatch'] = '' then options.Values['CBookMatch'] := '1';
  if options.Values['CCDMatch'] = '' then options.Values['CCDMatch'] := '1';
  if options.Values['CWorkMatch'] = '' then options.Values['CWorkMatch'] := '1';
  if options.Values['CPaintMatch'] = '' then options.Values['CPaintMatch'] := '1';
  if options.Values['ChildAge'] = '' then options.Values['ChildAge'] := '10';
  if options.Values['Paper'] = '' then options.Values['Paper'] := 'A4';
  if options.Values['MatchAddress'] = '' then options.Values['MatchAddress'] := 'Reghaabat.mdb';
  if options.Values['LibraryAddress'] = '' then options.Values['LibraryAddress'] := 'Library.mdb';
  if options.Values['Theme'] = '' then options.Values['Theme'] := 'Blue';
  if options.Values['ComputerID'] = '' then options.Values['ComputerID'] := getComputerID;
  if options.Values['UserIdStart'] = '' then options.Values['UserIdStart'] := '1111';

  printer:= TPrinter.Create;
  if printer.Printers.Count = 0 then tmp := 0 else tmp := printer.PrinterIndex;
  if options.Values['Printer'] = '' then options.Values['Printer'] :=  IntToStr(tmp);

  if options.Values['LvMin1'] = '' then options.Values['LvMin1'] := '7';
  if options.Values['LvMax1'] = '' then options.Values['LvMax1'] := '9';
  if options.Values['LvMin2'] = '' then options.Values['LvMin2'] := '10';
  if options.Values['LvMax2'] = '' then options.Values['LvMax2'] := '12';
  if options.Values['LvMin3'] = '' then options.Values['LvMin3'] := '13';
  if options.Values['LvMax3'] = '' then options.Values['LvMax3'] := '15';
  if options.Values['LvMin4'] = '' then options.Values['LvMin4'] := '16';
  if options.Values['LvMax4'] = '' then options.Values['LvMax4'] := '20';

  if options.Values['BookTip'] = '' then options.Values['BookTip'] := 'نوشتن خلاصه‌ای از کتاب مسابقه به اندازه پاسخ‌گویی به سوالها امتیاز دارد.';
  if options.Values['WorkTip'] = '' then options.Values['WorkTip'] := 'گزارشی از نحوه انجام خواسته‌های مسابقه تهیه کنید.';
  if options.Values['PaintTip'] = '' then options.Values['PaintTip'] := 'امتیاز مسابقه به حوصله، دقت و استعداد شما داده می‌شود.';
  if options.Values['MultiMediaTip'] = '' then options.Values['MultiMediaTip'] := 'نوشتن خلاصه‌ای از محتوی مسابقه به اندازه پاسخ‌گویی به سوالها امتیاز دارد.';

  WriteOptions(client);

  if protect then
  begin
    options.Values['ServerAddress'] := serverTmp;
    options.Values['MatchAddress'] := matchTmp;
    options.Values['LibraryAddress'] := libraryTmp;
    options.Values['Theme'] := themeTmp;
  end;
  end;
end;

procedure TfMain.WriteOptions(client : boolean; writeAddress : string);
var filename, exen : string;
begin
  if client then
  begin
     if writeAddress = '' then exen := options.Values['ServerAddress'] else exen := writeAddress;
  end else exen := Application.ExeName;
  filename := ExtractFileDir(exen)+'\op.mpt';
  options.SaveToFile(filename, TEncoding.UTF8);
  EncodeFile(filename);
end;

procedure TfMain.DeLogin();
begin
  pStatus.Visible := false;
  bDeLogin.Visible := pStatus.Visible;
  EAF(False);

  loginUser := uUser;
  loginGender := gMale;
  loginUserID := '';

  bLogin.Hint := '';
  lLogin.Caption := '';
  lLicense.Caption := '';

  pLogin.Visible := true;
  ME_Login.SetFocus;
end;

procedure TfMain.MyShowMessage(str : String; desktop : boolean );
begin
  if desktop then msgDialog.Position := poDesktopCenter;
  msgDialog.Caption := str;
  msgDialog.Execute;
  if desktop then msgDialog.Position := poMainFormCenter;
  fMain.SetFocus;
end;

procedure TfMain.ELUser( Cascade : Boolean );
begin
  pLogin.Visible := false;
  PassWordEdit.Text:='';
  bDeLogin.ImageIndex := 0;
  bDeLogin.Hint := 'خروج از حساب کاربر';
  pStatus.Visible := true;
  bDeLogin.Visible := pStatus.Visible;
  nSkin.Enabled := True;
end;
procedure TfMain.ELOperator( Cascade : Boolean );
begin
  ELUser(True);

  LicenseCheckBool := False;
  try
    LicenseCheckBool := LicenceCheck;
  except on E: Exception do
  end;

  if LicenseCheckBool then
  begin
    nUser.Enabled:=True;
//x    nMessage.Enabled:=True;
//x    nDeliver.Enabled:=True;
//x    nReceive.Enabled:=True;
//x    nScoreList.Enabled:=True;
//x    nDeliverClick(nil);
  end;
end;

procedure TfMain.ELDesigner( Cascade : Boolean );
begin
  ELOperator(True);

  pStatus.Visible := true;
  bDeLogin.Visible := pStatus.Visible;

  BB_Delete.Enabled := True;

  nResources.Enabled := True;
  nQuestionMatches.Enabled := True;
  nInstructionMatches.Enabled := True;
//x  nMatchList.Enabled := True;
end;

procedure TfMain.ELManager( Cascade : Boolean );
begin
  ELDesigner(True);

  if StrToBool(options.Values['DownGrade']) then
  begin
    bDeLogin.ImageIndex := 1;
    bDeLogin.Hint := 'تنزل به ' + UserToPersian(uOperator);
  end;

//x  nLabel.Enabled:=True;
  if LicenseCheckBool then
  begin
//x    nPay.Enabled:=True;
//x    nFreeScore.Enabled:=True;
//x    nSetScore.Enabled:=True;
//x    nTotalReport.Enabled:=True;
//x    nDesigner.Enabled:=True;
//x    nLog.Enabled:=True;
//x    nDesignerList.Enabled:=True;
//    nChart.Enabled:=True;
//x    nImport.Enabled:=True;
//x    nUpload.Enabled := True;
//    N_Sentence.Enabled:=True;
  end;
end;

procedure TfMain.ELAdmin();
begin
  ELManager(True);
  nOptions.Enabled:=True;
end;

procedure TfMain.EAF(Low : Boolean);
begin
  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;

  BB_Delete.Enabled := False;

  if not Low then
  begin
    nUser.Enabled:=False;
    nDeliver.Enabled:=False;
    nReceive.Enabled:=False;
    nScoreList.Enabled:=False;
    nMessage.Enabled:=False;
    nSkin.Enabled := False;
  end;

  nResources.Enabled := False;
  nQuestionMatches.Enabled := False;
  nInstructionMatches.Enabled := False;
  nPay.Enabled:=False;
  nSetScore.Enabled:=False;
  nTotalReport.Enabled:=False;
  nLog.Enabled:=False;
  nOptions.Enabled:=False;
  nDesigner.Enabled:=False;
  nDesignerList.Enabled:=False;
  nMatchList.Enabled:=False;
  nFreeScore.Enabled:=False;
  nChart.Enabled:=False;
  nImport.Enabled:=False;
  nLabel.Enabled:=False;
  nUpload.Enabled:=False;
  N_Sentence.Enabled:=False;

  P_LS.ImageIndex := -1;
  L_LS.Caption := '';
end;

function TfMain.AddExtension(filename, ext : string) : string;
begin
  Result := filename;
  if not(UpperCase(ExtractFileExt(filename)) = UpperCase(ext)) then
    Result := Result + ext;
end;

procedure TfMain.ScaleBmp(bitmp: TBitmap);
var
  TmpBmp: TBitmap;
  ARect: TRect;
  hi, wi: Integer;
begin
  TmpBmp := TBitmap.Create;
  try
    hi := 72;
    wi := 54;
    TmpBmp.Width := wi;
    TmpBmp.Height := hi;
    ARect := Rect(0, 0, wi, hi);
    TmpBmp.Canvas.StretchDraw(ARect, Bitmp);
    bitmp.Assign(TmpBmp);
  finally
    TmpBmp.Free;
  end;
end;

function TfMain.LicenceCheck(Show : Boolean) : Boolean;
var
  cID, Beg, En, Today, TempS :String;
  DtD : Integer;
begin
  Result := False;
  lLicense.Caption := '';
  lLicense.Font.Color := clRed;

  qTmp.SQL.Text := 'SELECT * FROM library';
  qTmp.Open;

  if qTmp.RecordCount = 0 then
  begin
    if Show then lLicense.Caption := 'لطفا مجوز برنامه را وارد کنید';
  end else
  begin
    try
      TempS := LicenceToShamsi(Beg, En, qTmp.FieldByName('Licence').AsString, qTmp.FieldByName('ServerID').AsString);
      DtD := DayToDay(getShamsiDate, TempS);
    except
      TempS := '1300/00/00';
    end;
    if TempS = '1300/00/00' then
    begin
      if Show then lLicense.Caption := 'مجوز برنامه معتبر نیست';
      Abort;
    end;

    Today := getShamsiDate;
    if (Today < Beg) or (Today > En) then
    begin
      if Show then lLicense.Caption := 'مجوز برنامه در این تاریخ اعتبار ندارد'
    end else
    begin
      Result := True;
      if Show then
      begin
        lLicense.Font.Color := $00723708;
        lLicense.Caption := 'مجوز برنامه تا تاریخ ' + En + ' اعتبار دارد';
      end;
    end;
  end;
end;

function TfMain.getNewMatchID(Kind : Byte): String;
begin
  qTmp.SQL.Text:='SELECT MAX(ID) FROM Matches WHERE ID div 10000 = 3'+ IntToStr(Kind);
  qTmp.Open;
  if qTmp.RecordCount = 1 then
  begin
    if qTmp.Fields[0].AsInteger = 0 then
      Result := IntToStr(300000 + Kind * 10000 + 1 * 1000 + 1)
    else
      Result := IntToStr(qTmp.Fields[0].AsInteger + 1);
  end else Result := '000000';
  Result := MatchIDToStr(Result);
end;

function TfMain.searchMatch(Str : String) : Boolean;
begin
  qTmp.SQL.Text := 'SELECT ID FROM Matches WHERE ID = '+ Str;
  qTmp.Open;
  if qTmp.RecordCount = 1 then Result := True else Result := False;
end;

function TfMain.AddressToConnectionString( Address : String ) : String;
begin
  Result := 'Provider=Microsoft.Jet.OLEDB.4.0;'+
            'User ID=Admin;'+
            'Data Source='+ Address +';'+
            'Mode=Share Deny None;'+
            'Extended Properties="";'+
            'Persist Security Info=False;'+
            'Jet OLEDB:System database="";'+
            'Jet OLEDB:Registry Path="";'+
            'Jet OLEDB:Database Password=abrdmkazhdpkzsrst;'+
            'Jet OLEDB:Engine Type=5;'+
            'Jet OLEDB:Database Locking Mode=1;'+
            'Jet OLEDB:Global Partial Bulk Ops=2;'+
            'Jet OLEDB:Global Bulk Transactions=1;'+
            'Jet OLEDB:New Database Password="";'+
            'Jet OLEDB:Create System Database=False;'+
            'Jet OLEDB:Encrypt Database=False;'+
            'Jet OLEDB:Don''t Copy Locale on Compact=False;'+
            'Jet OLEDB:Compact Without Replica Repair=False;'+
            'Jet OLEDB:SFP=False';
end;

procedure TfMain.presetMenu();
begin
  with fMain do
  begin
    P_Temp.Visible := True;
    P_User.Visible := False;
    P_MatchEdit.Visible := False;
    P_SearchUser.Visible := False;
  end;
end;
procedure TfMain.postsetMenu(title : string; form : TForm);
begin
  with fMain do
  begin
    AdvToolBarPager.Caption.Caption := title;
    form.BringToFront;
    P_Temp.Visible := False;

    if ICLibrary.Visible then
    begin
     if fUser = nil then fUser.bImportFromLibrary.Visible := True;
    end;
  end;
end;

procedure TfMain.fillComboWithQuery(cb : TComboBox; isql : string);
var i : integer;
begin
  with myQueryTmp do
  begin
    SQL.Text := isql;
    Open;
    if cb.Items.Count <> RecordCount then
    begin
      cb.Items.Clear;
      for i := 1 to RecordCount do
      begin
        cb.Items.Add(Fields[0].AsString);
        next;
      end;
    end;
  end;
  cb.ItemIndex := 0;
end;

procedure TfMain.showResourceForm();
var rc : TResourceContent;
begin
  presetMenu;

  if fResource = nil then
  begin
    Application.CreateForm(TfResource, fResource);
    fResource.cbKind.Items.Clear;
    for rc := rBook to rMultiMedia do
      fResource.cbKind.Items.Add(ResourceToPersian(rc));
    fResource.refresh;
  end;

  postsetMenu('منابع', fResource);
end;
procedure TfMain.showQuestionMatchForm();
begin
  presetMenu;

  if fQuestionMatch = nil then
  begin
    Application.CreateForm(TfQuestionMatch, fQuestionMatch);
    fQuestionMatch.refresh;
  end;

  postsetMenu('مسابقه‌های پرسشی', fQuestionMatch);
end;
procedure TfMain.showInstructionMatchForm();
begin
  presetMenu;

  if fInstructionMatch = nil then
  begin
    Application.CreateForm(TfInstructionMatch, fInstructionMatch);
    fInstructionMatch.refresh;
  end;

  postsetMenu('مسابقه‌های دستوری', fInstructionMatch);
end;

procedure TfMain.nConnectMatchClick(Sender: TObject);
var Ok : Boolean; matchAddress : string;
begin
  Ok := True;
{
  if isClient then matchAddress := 'MatchClientAddress' else matchAddress := 'MatchAddress';

  if FileExists(options.Values[matchAddress]) then
  begin
    cMatch.Close;
    cMatch.ConnectionString := AddressToConnectionString(options.Values[matchAddress]);
    try
      cMatch.Open;
      Backup(options.Values[matchAddress]);
    except on E: Exception do
      Ok := false;
    end;
    DeLogin;
  end else Ok := False;
}
  if not Ok then
  begin
    MyShowMessage('لطفا مسیر اتصال به بانک اطلاعات مسابقه را تعیین کنید', true);
    M_ConnectPathMatchClick(nil);
  end else
  begin
    L_MatchDate.Caption := options.Values['BeginDate'];
    if L_MatchDate.Caption <> '' then Label1.Visible := True;

    qfLibrary.SQL.Text := 'SELECT Picture AS LibraryPicture FROM Pictures WHERE ID = 1';
    qTmp.SQL.Text := 'SELECT Licence FROM Library';
    qTmp.Open;

    ICMatch.Visible := True;
    pLogin.Visible := True;
    pStatus.Visible := not pLogin.Visible;
    bDeLogin.Visible := pStatus.Visible;

    {x
    if qTmp.Fields[0].AsString = '' then
    begin
      ME_Login.Text := '1111';
      PassWordEdit.Text := '1';
      bLogin.Click;
      AdvToolBarPager.ActivePageIndex := 1;
      nMatchList.Click;
      bDeLogin.Visible := false;
    end else
    begin
    }
      ME_Login.Text := '';
      PassWordEdit.Text := '';
      ME_Login.SetFocus;
    //xend;
  end;
end;

procedure TfMain.nConnectLibraryClick(Sender: TObject);
var Ok : Boolean; libraryAddress : string;
begin
  Ok := True;
  if isClient then libraryAddress := 'LibraryClientAddress' else libraryAddress := 'LibraryAddress';

  if FileExists(options.Values[libraryAddress]) then
  begin
    cLibrary.Close;
    cLibrary.ConnectionString := AddressToConnectionString(options.Values[libraryAddress]);
    try
      cLibrary.Open;
    except on E: Exception do
      Ok := false;
    end;
  end else Ok := False;

  if not Ok then
  begin
    MyShowMessage('لطفا مسیر اتصال به بانک اطلاعات کتابخانه را تعیین کنید', true);
    M_ConnectPathLibrary.Click;
  end else
  begin
    if fUser <> nil then
    begin
      fUser.bImportFromLibrary.Visible := True;
    end;

    if F_TDE <> nil then
    begin
      F_TDE.Label14.Visible := True;
      F_TDE.MaskEdit3.Visible := True;
      F_TDE.T_CheckBoxLibrary.Visible := True;

      F_TDE.Label26.Visible := True;
      F_TDE.MaskEdit5.Visible := True;

      F_TDE.D_CheckBoxLibrary.Visible := True;
    end;

    if fFreeScore <> nil then
    begin
      fFreeScore.Label3.Visible := true;
      fFreeScore.MaskEdit2.Visible := true;
    end;

    if fOptions <> nil then
    begin
      fOptions.CH_AutoConnectLibrary.Visible := true;
    end;

    ICLibrary.Visible := True;
  end;
end;

procedure TfMain.nLabelClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'برچسبها';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if F_Form = nil then
    Application.CreateForm(TF_Form, F_Form);

  F_Form.BringToFront;
  P_Temp.Visible := False;
end;

function GetContent( str : string ) : string;
begin
  Result := Copy(str, 4, Length(str)-7);
end;
function DecodeLine( str : string; i : integer ) : string;
var
  j, len : integer;
  chars : PWideChar;
begin
  Chars := PChar(str);
  len := Length(str);
  for j := 0 to len-1 do
    Chars[j] := CHR(ord(Chars[j]) - (j mod 5 + i mod 10 + 14) );
  Result := chars;
end;
procedure TfMain.DecodeFile(filename : string);
var
  i : integer;
  sls, sld : TStringList;
begin
  sld := TStringList.Create; sls := TStringList.Create;
  sls.LoadFromFile(filename, TEncoding.UTF8);
  for i := 0 to sls.Count-1 do sld.Add(DecodeLine(sls.Strings[i], i));
  sld.SaveToFile(filename, TEncoding.UTF8);
  sls.Free; sld.Free;
end;
function EncodeLine( str : string; i : integer ) : string;
var
  j, len : integer;
  chars : PWideChar;
begin
  Chars := PChar(str);
  len := Length(str);
  for j := 0 to len-1 do
    Chars[j] := CHR(ord(Chars[j]) + (j mod 5 + i mod 10 + 14) );
  Result := chars;
end;
procedure TfMain.EncodeFile(filename : string);
var
  i : integer;
  sls, sld : TStringList;
begin
  sld := TStringList.Create; sls := TStringList.Create;
  sls.LoadFromFile(filename, TEncoding.UTF8);
  for i := 0 to sls.Count-1 do sld.Add(EncodeLine(sls.Strings[i], i));
  sld.SaveToFile(filename, TEncoding.UTF8);
  sls.Free; sld.Free;
end;

procedure TfMain.nImportClick(Sender: TObject);
var
  sl : TStringList;
  i : integer;
  line, sentence, person : String;
begin
  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  odDatabase.FileName := '';
  if odDatabase.Execute then
  begin
    AdvToolBarPager.Caption.Caption := 'واردات';
    if fImport = nil then
      Application.CreateForm(TfImport, fImport);

    if ExtractFileExt(odDatabase.FileName) = '.mdb' then
    begin
      cImport.Close;
      cImport.ConnectionString:= AddressToConnectionString(odDatabase.FileName);
      cImport.Open;

      qTmpImport.SQL.Text := 'SELECT * FROM Licences';
      qTmpImport.Open;
      if qTmpImport.RecordCount > 0 then
      begin
        MyShowMessage('بانکهایی می توانند وارد برنامه شوند که مجوز نداشته باشند');
        Abort;
      end;
    end else Abort;

    with fImport do
    begin
      bAdd.Enabled := false;
      bReplaceAll.Enabled := false;

      L_Grid.Caption := '';
      L_Name.Caption := '';
      L_Code.Caption := '';
      L_Score.Caption := '';
      L_Age.Caption := '';
      L_ShowMatch.Caption := '';
      Image1.Picture := nil;
      selectedMatches := 0;

      gSame.RemoveRows( 2, gSame.RowCount-2 );
      gSame.ClearRows(1,1);
    end;

    thrImport;

    fImport.BringToFront;
    P_Temp.Visible := False;
  end;
end;

procedure TfMain.thrImport();
var
  i, j : integer;
begin
  with fImport do
  begin
    qTmpImport.SQL.Text := 'SELECT ID, Title FROM Matches';
    qTmpImport.Open;
    ProgressBegin('آماده سازی', qTmpImport.RecordCount);

    for i := 1 to 4 do
    begin
      qTmp.SQL.Text := 'SELECT ID, Title FROM Matches WHERE ID div 10000 = 3' + IntToStr(i);
      qTmp.Open;
      qTmpImport.SQL.Text := qTmp.SQL.Text;
      qTmpImport.Open;
//      MakeLCSCompare(qTmpImport, qTmp);
    end;
    ProgressEnd;

    if CB_Match.ItemIndex <> 0 then CB_Match.ItemIndex := 0 else CB_MatchChange(nil);
  end;
end;

procedure incChar(var a : Char);
begin
  a := chr(ord(a) + 1);
end;

procedure changeMatchID(mids : TStringList; var matchid : string);
begin
  while mids.Values[matchid] <> '' do
  begin
    if matchid[5] <> '9' then incChar(matchid[5])
    else if matchid[6] <> '9' then incChar(matchid[6])
    else if matchid[7] <> '9' then incChar(matchid[7])
    else if matchid[4] = '-' then matchid[4] := '0' else incChar(matchid[4]);
  end;
end;

procedure TfMain.CopyMatchFromFileToDB(filename : string);
var
  i, j, from, c : integer;
  sl, MIDs : TStringList;
  Cont : Boolean;
  LID, MatchID, iMatchID, BookID, Designer, GroupID, MaxScore, Title, QPPaper, Age, State, Author, Publication, Memo, PictureAddress, Size : string;
  S1, S2, S3, S4, ST, Question, Answer, TempCont, line, imgName : string;
begin
{
  with zipMaster do
  begin
    Clear;
    zipMaster.ZipFileName := odDatabase.FileName;
    Password := '';
    AddOptions := AddOptions - [AddEncrypt];
    FSpecArgs.Add('*.*');
    ExtrBaseDir := sendFolderAddress;
    ExtrOptions := ExtrOptions + [ExtrOverwrite];
    Extract;
  end;

  MIDs := TStringList.Create;
  sl := TStringList.Create;
  sl.LoadFromFile(sendFolderAddress + 'temp.match', TEncoding.UTF8);

  adoCommand.CommandText := 'DELETE FROM wMatchInfo;'; adoCommand.Execute;
  adoCommand.CommandText := 'DELETE FROM wBookInfo;'; adoCommand.Execute;
  adoCommand.CommandText := 'DELETE FROM wContent;'; adoCommand.Execute;
  adoCommand.CommandText := 'DELETE FROM wQuestion;'; adoCommand.Execute;

  aqTemp.SQL.Text := 'SELECT wMatchInfo.* FROM wMatchInfo;'; aqTemp.Open;
  aqTemp2.SQL.Text := 'SELECT wBookInfo.* FROM wBookInfo;'; aqTemp2.Open;
  aqTemp3.SQL.Text := 'SELECT wContent.* FROM wContent;'; aqTemp3.Open;
  aqTemp4.SQL.Text := 'SELECT wQuestion.* FROM wQuestion;'; aqTemp4.Open;

  for i := 0 to sl.Count-1 do
  begin
    line := DecodeLine(sl.Strings[i], i);
    if AnsiStartsStr('<R>', line) then
    begin
      MatchID := ''; BookID := ''; Designer := ''; GroupID := ''; MaxScore := ''; Title := ''; QPPaper := '0'; Age := ''; State := ''; Author := ''; Publication := ''; Memo := ''; PictureAddress := ''; Size := '';
      Question := ''; Answer := '';
      Cont := false;
    end
    else if Cont then
    begin
      if AnsiEndsStr('</O>', line) then
      begin
        Memo := TempCont + #13 + Copy(line, 1, Length(line)-4);
        Cont := false;
      end else if AnsiEndsStr('</Q>', line) then
      begin
        Question := TempCont + #13 + Copy(line, 1, Length(line)-4);
        Cont := false;
      end else if AnsiEndsStr('</A>', line) then
      begin
        Answer := TempCont + #13 + Copy(line, 1, Length(line)-4);
        Cont := false;
      end else
        TempCont := TempCont + #13 + line;
    end
    else if AnsiStartsStr('<I>', line) then
    begin
      MatchID := GetContent(line);
      iMatchID := MatchID;
      if MIDs.Values[MatchID] = '' then MIDs.Values[MatchID] := '1' else changeMatchID(MIDs, MatchID);
    end
    else if AnsiStartsStr('<Z>', line) then LID := GetContent(line)
    else if AnsiStartsStr('<E>', line) then BookID := GetContent(line)
    else if AnsiStartsStr('<D>', line) then Designer := GetContent(line)
    else if AnsiStartsStr('<L>', line) then GroupID := GetContent(line)
    else if AnsiStartsStr('<M>', line) then MaxScore := GetContent(line)
    else if AnsiStartsStr('<T>', line) then Title := GetContent(line)
    else if AnsiStartsStr('<G>', line) then Age := GetContent(line)
    else if AnsiStartsStr('<X>', line) then QPPaper := GetContent(line)
    else if AnsiStartsStr('<K>', line) then State := GetContent(line)
    else if AnsiStartsStr('<U>', line) then Author := GetContent(line)
    else if AnsiStartsStr('<B>', line) then Publication := GetContent(line)
    else if AnsiStartsStr('<S>', line) then Size := GetContent(line)
    else if AnsiStartsStr('<O>', line) then
    begin
      if AnsiEndsStr('</O>', line) then Memo := GetContent(line) else
      begin
        TempCont := Copy(line, 4, Length(line)-3);
        Cont := true;
      end;
    end
    else if AnsiStartsStr('<Q>', line) then
    begin
      if Question <> '' then aqTemp4.AppendRecord([MatchID, Question, Answer]);
      Question := ''; Answer := '';

      if AnsiEndsStr('</Q>', line) then Question := GetContent(line) else
      begin
        TempCont := Copy(line, 4, Length(line)-3);
        Cont := true;
      end;
    end
    else if AnsiStartsStr('<A>', line) then
    begin
      if AnsiEndsStr('</A>', line) then Answer := GetContent(line) else
      begin
        TempCont := Copy(line, 4, Length(line)-3);
        Cont := true;
      end;
    end
    else if AnsiStartsStr('</R>', line) then
    begin
      if Question <> '' then aqTemp4.AppendRecord([MatchID, Question, Answer]);

      aqTemp.AppendRecord([MatchID, GroupID, BookID, Designer, MaxScore, Title, QPPaper, Age, State, False, False]);

      State := LeftStr(MatchID, 2);
      if (State = '31') or (State = '34') then
      begin
        aqTemp2.AppendRecord([MatchID, Author, Publication]);
      end else
      begin
        S1 := ''; S2 := ''; from := 1; c := 0;
        for j := 1 to Length(Size) do
          if Size[j] = '-' then
          begin
            ST := Copy(Size, from, c);
            from := j+1; c := 0;
            if S1 = '' then S1 := ST else if S2 = '' then S2 := ST else S3 := ST;
          end else c := c + 1;
        S4 := Copy(Size, from, c);

        aqTemp3.AppendRecord([MatchID, Memo, nil, S1, S2, S3, S4]);
        imgName := sendFolderAddress + LID + '_' + iMatchID + '.jpg';
        if FileExists(imgName) then
        begin
          aqTemp3.Edit;
          TBlobField(aqTemp3.FieldByName('Picture')).LoadFromFile(imgName);
          aqTemp3.Post;
          DeleteFile(imgName);
        end;
      end;
    end;
  end;
  sl.Free;
  MIDs.Clear;
  DeleteFile(sendFolderAddress + 'temp.match');
}
end;

procedure TfMain.BB_DeleteClick(Sender: TObject);
var str : string;
begin
{x
  str := StrToMatchID(MaskEdit4.Text);
  if SearchMatch(str) then
  begin
    if msgDelete.ExecuteDialog = mrYes then
    begin
      deleteMatch(str);

      case StrToInt(LeftStr(str, 2)) of
        31 : nDesignBook.Click;
        34 : nDesignMultiMedia.Click;
        32 : nDesignWork.Click;
        33 : nDesignArt.Click;
      end;
    end;
  end else MyShowMessage('چنین مسابقه‌ای وجود ندارد');
}
end;

procedure SetComboItem(cb : TComboBox; str : String);
var
  i : integer;
begin
  for i := 1 to cb.Items.Count do
      if str = cb.Items.Strings[i] then cb.ItemIndex := i;
end;

function GetMatchGroup(id : string):integer;
begin
  if Length(id) = 2 then
    Result := StrToInt(RightStr(id, 1))-1
  else Result := 0;
end;

procedure TfMain.BB_ModifyClick(Sender: TObject);
var
  Str : String;
  isBookMatch : Boolean;
  i, tokpos : Integer;
begin
{x
  isBookMatch := False;
  Str := StrToMatchID(MaskEdit4.Text);
  if SearchMatch(Str) then
  begin
  case StrToInt(LeftStr(Str , 2)) of
    31 :
    begin
      nDesignBook.Click;
      isBookMatch := True;
    end;
    34 :
    begin
      nDesignMultiMedia.Click;
      isBookMatch := True;
    end;
    32 : nDesignWork.Click;
    33 : nDesignArt.Click;
  end;

// Book ------------------------------------------------------------------------
  if isBookMatch then
  begin
    qTmp.SQL.Text := 'SELECT * FROM Matches WHERE ID = '+ Str;
    qTmp.Open;

    with fDesignBC do
    begin
      Label2.Caption := MatchIDToStr(qTmp.FieldByName('ID').AsString);
      MaskEdit1.Text := qTmp.FieldByName('LibraryBookID').AsString;
      MaskEdit2.Text := qTmp.FieldByName('DesignerID').AsString;
      SpinEdit1.Text := qTmp.FieldByName('MaxScore').AsString;
      SpinEdit2.Text := qTmp.FieldByName('QPPaper').AsString;
      Edit5.Text := qTmp.FieldByName('Title').AsString;
      SpinEdit4.Text := qTmp.FieldByName('Age').AsString;
      ComboBox2.ItemIndex := qTmp.FieldByName('State').AsInteger;
      Edit1.Text := qTmp.FieldByName('Author').AsString;
      Edit2.Text := qTmp.FieldByName('Publication').AsString;
      clTags.Text := qTmp.FieldByName('Tags').AsString;
      genuineID := qTmp.FieldByName('GenuineID').AsString;

      qTmp.SQL.Text := 'SELECT * FROM Questions WHERE MatchID = '+ Str +' ORDER BY ID';
      qTmp.Open;

      for i := 1 to qTmp.RecordCount do
      begin
        Grid.Cells[0,i] := qTmp.FieldByName('ID').AsString;
        Grid.Cells[1,i] := qTmp.FieldByName('Question').AsString;
        Grid.Cells[2,i] := qTmp.FieldByName('Answer').AsString;
        Grid.AddRow;
        qTmp.Next;
      end;
      Grid.Cells[0,qTmp.RecordCount+1] := IntToStr(qTmp.RecordCount+1);

      mQuestion.Text := Grid.Cells[1,1];
      mAnswer.Text := Grid.Cells[2,1];
    end;
  end;

// Paint Or Work ---------------------------------------------------------------
  if not(isBookMatch) then
  begin
    qTmp.SQL.Text := 'SELECT * FROM Matches WHERE ID = '+ Str;
    qTmp.Open;

    with fDesignWP do
    begin
      Label2.Caption := MatchIDToStr(qTmp.FieldByName('ID').AsString);
      MaskEdit2.Text := qTmp.FieldByName('DesignerID').AsString;
      SpinEdit1.Text := qTmp.FieldByName('MaxScore').AsString;
      Edit5.Text := qTmp.FieldByName('Title').AsString;
      SpinEdit4.Text := qTmp.FieldByName('Age').AsString;
      ComboBox2.ItemIndex := qTmp.FieldByName('State').AsInteger;
      genuineID := qTmp.FieldByName('GenuineID').AsString;
      Memo1.Text := qTmp.FieldByName('Content').AsString;
      clTags.Text := qTmp.FieldByName('Tags').AsString;
      genuineID := qTmp.FieldByName('GenuineID').AsString;

      tokpos := 1;
      SE_Height.Text := getNextToken(qTmp.FieldByName('PictureConfiguration').AsString, ' ', tokpos);
      SE_Width.Text := getNextToken(qTmp.FieldByName('PictureConfiguration').AsString, ' ', tokpos);
      SE_Top.Text := getNextToken(qTmp.FieldByName('PictureConfiguration').AsString, ' ', tokpos);
      SE_Left.Text := getNextToken(qTmp.FieldByName('PictureConfiguration').AsString, ' ', tokpos);

      loadJpeg(qTmp.FieldByName('ID').AsString, 'match', fDesignWP.Image1, qTmp);
    end;
  end;

  end else MyShowMessage('چنین مسابقه‌ای وجود ندارد');
}
end;

procedure TfMain.nOptionsClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'تنظیمات';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fOptions = nil then
    Application.CreateForm(TfOptions, fOptions);

  if fMain.ICLibrary.Visible then
    fOptions.CH_AutoConnectLibrary.Visible := true;

  if fMain.ICMatch.Visible then
  begin
    ReadOptions(isClient, true);
  with fOptions do
  begin
    imgChange := false;

    if Sender <> nil then chServer.Checked := fMain.isClient;
    eServerAddress.Text := fMain.options.Values['ServerAddress'];
    eServerAddress.Enabled := chServer.Checked;
    edt1.Text := getComputerID;
    {x
    qGroup.SQL.Text := 'SELECT ID, Caption FROM Groups ORDER BY ID';
    qGroup.Open;

    fMain.qTmp.SQL.Text := 'SELECT * FRoM Library'; fMain.qTmp.Open;
    E_Title.Text := fMain.qTmp.FieldByName('Title').AsString;
    fMain.loadJpeg('1', Image1, fMain.qTmp);
    }
    ME_MatchDate.Text := fMain.options.Values['BeginDate'];
    CH_AutoConnectLibrary.Checked := StrToBool(fMain.options.Values['AutoConnectLibrary']);
    chDownGrade.Checked := StrToBool(fMain.options.Values['DownGrade']);
    SpinEdit1.Value := StrToInt(fMain.options.Values['CBookMatch']);
    SpinEdit2.Value := StrToInt(fMain.options.Values['CCDMatch']);
    SpinEdit3.Value := StrToInt(fMain.options.Values['CWorkMatch']);
    SpinEdit4.Value := StrToInt(fMain.options.Values['CPaintMatch']);
    SE_ChildAge.Value := StrToInt(fMain.options.Values['ChildAge']);
    if fMain.options.Values['Paper'] = 'A5' then cbPaper.ItemIndex := 1 else cbPaper.ItemIndex := 0;
    cbPrinter.ItemIndex := StrToInt(fMain.options.Values['Printer']);
    // level grid
    gLevel.RowCount := 2;
    gLevel.ClearRows(1,1);

    i := 1;
    while options.Values['LvMin' + IntToStr(i)] <> '' do
    begin
      gLevel.AddRow;
      gLevel.Cells[1,i] := 'سطح ' + IntToStr(i);
      gLevel.Cells[2,i] := options.Values['LvMin' + IntToStr(i)];
      gLevel.Cells[3,i] := options.Values['LvMax' + IntToStr(i)];
      inc(i);
    end;
    gLevel.RemoveRows(gLevel.RowCount,1);
  end;
  end;

  fOptions.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.nUploadClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'ارسال اطلاعات';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if F_Web = nil then
    Application.CreateForm(TF_Web, F_Web);
{
  fMain.qTmp.SQL.Text := 'SELECT * FROM Library';
  fMain.qTmp.Open;
  F_Web.MatchID := fMain.qTmp.FieldByName('LibraryID').AsString;

  if F_Web.MatchID = '' then
  begin
    F_Web.MatchID := getComputerID;
    fMain.executeCommand('UPDATE Library SET LibraryID = "'+ F_Web.MatchID +'";');
  end;
{
  F_Web.gSend.Height := 1;
  F_Web.RefreshGrid;
}
  F_Web.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.N_SentenceClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'جملات قصار';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if F_Sentence = nil then
    Application.CreateForm(TF_Sentence, F_Sentence);

  if fMain.ICMatch.Visible then
    F_Sentence.BitBtn2.Click;

  F_Sentence.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.LoadFastReport( FName : String );
begin
  frxReport.LoadFromFile(ExtractFileDir(Application.ExeName)+ '\Reports\' + FName + '.fr3');
end;

procedure TfMain.nUserClick(Sender: TObject);
begin
  presetMenu;

  if fUser = nil then
    Application.CreateForm(TfUser, fUser);

  with fUser do
  begin
    if (loginUser < uManager) and (loginUser <> uOperator) then
    begin
      gMenu.Visible := false;
      meUserID.Text := loginUserID;
      loadData(StrToInt(loginUserID));
    end else
    begin
      gMenu.Visible := true;
      fUser.refresh;
    end;
  end;

  postsetMenu('مدیریت اعضا', fUser);
end;

procedure TfMain.nTotalReportClick(Sender: TObject);
var coeff : double;
begin
  AdvToolBarPager.Caption.Caption := 'گزارش جامع امتیازات';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fLog = nil then
    Application.CreateForm(TfTotalReport, fTotalReport);

  fTotalReport.RefreshInformation;
  with fTotalReport do
  begin
    qTmp.SQL.Text := 'SELECT Round(Sum(RealScore)) FROM '+ sqlRealScores;
    qTmp.Open;
    lRealScore.Caption := IntToStr(qTmp.Fields[0].AsInteger);

    qTmp.SQL.Text := 'SELECT Sum(Score) FROM Payments WHERE ScoreDate >= "'+ options.Values['BeginDate'] +'"';
    qTmp.Open;
    lPayemnt.Caption := IntToStr(qTmp.Fields[0].AsInteger);

    lDifference.Caption := IntToStr(StrToInt(lRealScore.Caption) - StrToInt(lPayemnt.Caption));

    // Predict
    qTmp.SQL.Text := 'SELECT Sum(MaxScore) FROM Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID WHERE ScoreDate >= "'+ options.Values['BeginDate'] +'"';
    qTmp.Open;
    if qTmp.Fields[0].AsFloat <> 0 then
    begin
      coeff := StrToFloat(lRealScore.Caption) / qTmp.Fields[0].AsFloat;
      qTmp.SQL.Text := 'SELECT Sum(MaxScore) FROM Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID WHERE DeliverDate Is Not Null AND DeliverDate >= "'+ options.Values['BeginDate'] +'" AND ScoreDate Is Null';
      qTmp.Open;
      lPredict.Caption := FloatToStr(Round(coeff * qTmp.Fields[0].AsInteger));
    end;
  end;

  fTotalReport.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.thmClick(Sender: TObject);
begin
  if Sender <> nil then
  begin
    options.Values['Theme'] := TMenuItem(Sender).Hint;
    WriteOptions;
  end;

  if options.Values['Theme'] = 'White' then
  begin
    apps.Style := tsWindows7;
    pagers.Style := TOfficePagerStyle.psWindowsVista;
    otbs.Style := TOfficeTabSetStyle.tsWindowsVista;
  end
  else if options.Values['Theme'] = 'Blue' then apps.Style := tsOffice2007Luna
  else if options.Values['Theme'] = 'Silver' then apps.Style := tsOffice2007Silver
  else if options.Values['Theme'] = 'Brown' then apps.Style := tsOffice2003Olive;
end;

procedure TfMain.nAboutClick(Sender: TObject);
begin
  if fAbout = nil then
    Application.CreateForm(TfAbout, fAbout);
  fAbout.ShowModal;
end;

procedure TfMain.nChartClick(Sender: TObject);
var
  i : integer;
begin
  AdvToolBarPager.Caption.Caption := 'نمودارها';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fChart = nil then
    Application.CreateForm(TfChart, fChart);

  AQTemp.SQL.Text := 'SELECT SubGroup.Caption FROM SubGroup WHERE (((SubGroup.ID) Like "5%")) ORDER BY SubGroup.ID;';
  AQTemp.Open;

  with fChart do
  begin
    cbbResume.Items.Clear;
    cbbResume.Items.Add('همه');
    for i := 1 to fMain.AQTemp.RecordCount do
    begin
      cbbResume.Items.Add(fMain.AQTemp.FieldByName('Caption').AsString);
      fMain.AQTemp.Next;
    end;
    cbbResume.ItemIndex := 0;
    btnChart.Click;
  end;

  fChart.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.bDeLoginClick(Sender: TObject);
begin
  if (StrToBool(options.Values['DownGrade'])) and ((isSuperUser)or( P_LS.ImageIndex = 1 )) then
  begin
    EAF(True);
    bDeLogin.ImageIndex := 0;
    bDeLogin.Hint := 'خروج از حساب کاربر';
    P_LS.ImageIndex := 0;
    L_LS.Caption := 'اپراتور';
    uPicture.ImageIndex := ord(loginGender);
    nDeliverClick(nil);
    loginUser := uUser;
  end else
    DeLogin;
end;

procedure TfMain.bLoginClick(Sender: TObject);
var dPermission, kind : String;
begin
  qTmp1.SQL.Text := 'SELECT * FROM users LEFT JOIN permissions ON users.ID = permissions.UserID WHERE users.ID = '+ ME_Login.Text;
  qTmp1.Open;

  if (qTmp1.RecordCount = 0) or (encrypt(PassWordEdit.Text) <> qTmp1.FieldByName('UserPass').AsString) then
  begin
    MyShowMessage('کد عضویت و یا کلمه عبور  معتبر نیست');
    PassWordEdit.SelectAll;
  end else
  begin
    loginUser := StringToUser(qTmp1.FieldByName('Permission').AsString);
    loginGender := StringToGender(qTmp1.FieldByName('Gender').AsString);
    loginUserID := ME_Login.Text;

    if isSuperUser then ELAdmin else
    if loginUser = uManager then ELManager(False) else
    if loginUser = uDesigner then ELDesigner(False) else
    if (loginUser = uOperator) or (loginUser = uUser) then ELOperator(False);
    P_LS.ImageIndex := ord(loginUser);
    L_LS.Caption := UserToPersian(loginUser);

    lLogin.Caption := qTmp1.FieldByName('FirstName').AsString + ' ' + qTmp1.FieldByName('LastName').AsString;

    {x
    qTmp1.SQL.Text := 'SELECT * FROM Messages WHERE Viewed = False AND DestinationID = '+ loginUserID;
    qTmp1.Open;
    if qTmp1.RecordCount > 0 then nMessage.ImageIndex := 2 else nMessage.ImageIndex := 1;
    }

    //x if P_User.Visible then B_Refresh.Click;
  end;
end;

procedure TfMain.bSyncClick(Sender: TObject);
begin
  syncDatabase();
end;

procedure TfMain.Backup(filename : string);
begin
  try
    CopyFile( PWideChar(filename + '_Arch'), PWideChar(filename + '_Arch_Arch'), LongBool(0) );
  except on E: Exception do end;
  try
    CopyFile( PWideChar(filename), PWideChar(filename + '_Arch'), LongBool(0) );
  except on E: Exception do end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  // build database
//  myCommand.Execute;
//  cMyLocal.Database := 'localmatch';

  SplashScreen.FocusParentForm := true;
  cStates[0] := 'فعال'; cStates[1] := 'وارد شده'; cStates[2] := 'غير فعال';
  cMatches[0] := 'همه مسابقات'; cMatches[1] := 'کتاب'; cMatches[2] := 'کارعملی'; cMatches[3] := 'هنری'; cMatches[4] := 'چند رسانه‌ای'; cMatches[5] := 'مسابقات آزاد';

  AdvToolBarPager.ActivePageIndex := 0;
  loginUser := uUser; loginGender := gMale; loginUserID := '';
  options := TStringList.Create;

  resourceAddress := ExtractFileDir(Application.ExeName)+'\Resource\';
  if not DirectoryExists(resourceAddress) then CreateDir(resourceAddress);
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  EAF(False);
  ReadOptions(false, false, true);
  thmClick(nil);
  nConnectMatchClick(nil);

  if ICMatch.Visible then
    if StrToBool(options.Values['AutoConnectLibrary']) then nConnectLibraryClick(nil);

  if pLogin.Visible then ME_Login.SetFocus;
end;

procedure TfMain.ME_LoginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then PassWordEdit.SetFocus;
end;

procedure TfMain.MaskEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = 13 )and( MaskEdit4.Text <> '   -   ' ) then BB_Modify.Click;
  MaskEdit4.SetFocus;
end;

procedure TfMain.ME_CodeClick(Sender: TObject);
begin
  ME_Code.SelectAll;
end;

procedure TfMain.ME_CodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i : Integer; F: array[1..4] of Integer;
begin
  if (Key = 13) and (ME_Code.Text <> '    ') then
  begin
    qTmp.SQL.Text := 'SELECT * FROM Users WHERE ID=' + ME_Code.Text;
    qTmp.Open;
    if qTmp.RecordCount < 1 then
    begin
      MyShowMessage('چنین عضوی وجود ندارد');
      userID := '';
      ME_Code.SetFocus;
      ME_Code.SelectAll;
      Abort;
    end;

    if not hasGenderPermission(qTmp.FieldByName('Gender').AsString) then
    begin
      MyShowMessage('شما اجازه‌ی دسترسی به این پرونده را ندارید');
      userID := '';
      ME_Code.SetFocus;
      ME_Code.SelectAll;
      Abort;
    end;

    ME_Code.Enabled := False;

    LName.Caption:= qTmp.FieldByName('FirstName').AsString;
    LFamily.Caption:= qTmp.FieldByName('LastName').AsString;
    LDescription.Caption:= qTmp.FieldByName('Description').AsString;
    LAge.Caption:= IntToStr(StrToInt(Copy(getShamsiDate, 1, 4)) - StrToInt(Copy(qTmp.FieldByName('BirthDate').AsString, 1, 4)));
    userID := ME_Code.Text;

    if LDescription.Caption <> '' then Label2.Visible := True;

    uPicture.Visible := not loadJpeg(userID, 'user', Picture, qTmp);

// TDE Code --------------------------------------------------------------------
  if F_TDE <> nil then
  with F_TDE do
  begin
    AdvOfficePager.Enabled := True;
    AdvOfficePager.OnChange(AdvOfficePager);

  // Deliver
    for i := 1 to 4 do
    begin
      qTmp.SQL.Text := 'SELECT UserID, MatchID, DeliverDate, ReceiveDate FROM Transactions '+
                     'WHERE UserID='+ userID +' AND MatchID Like "3'+ IntToStr(i) +'%" AND DeliverDate Is Not Null AND ReceiveDate Is Null AND DeliverDate >= "' + options.Values['BeginDate'] +'"';
      qTmp.Open;
      F[i] := qTmp.RecordCount;
    end;
    LCBook.Caption := IntToStr(F[1]); LCWork.Caption := IntToStr(F[2]); LCPaint.Caption := IntToStr(F[3]); LCCD.Caption := IntToStr(F[4]);

    qDeliver.SQL.Text := 'SELECT MatchID, Title, Age, MaxScore, Score, ReceiveDate, DeliverDate, ScoreDate FROM Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID '+
                         'WHERE DeliverDate Is Not Null AND UserID='+ userID +' AND DeliverDate >= "'+ options.Values['BeginDate'] +'" ORDER BY Score DESC';
    qDeliver.Open;

    if (P_LS.ImageIndex = 2) or (P_LS.ImageIndex = 1) then
    begin
      gDeliver.Columns[0].Width := 64; gDeliver.Columns[5].Width := 64;
    end else
    begin
      gDeliver.Columns[0].Width := 0;  gDeliver.Columns[5].Width := 0;
    end;

    for i := 0 to gDeliver.Columns.Count - 1 do
      gDeliver.Columns[i].Color := gDeliver.Color;

  // Receive
    qReceive.SQL.Text:='SELECT MatchID, Title, ReceiveDate FROM Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID '+
                       'WHERE ReceiveDate Is Null AND DeliverDate Is Not Null AND UserID='+ userID +' AND DeliverDate >= "'+ options.Values['BeginDate'] +'" ORDER BY MatchID';
    qReceive.Open;

    for i := 1 to qReceive.RecordCount do gReceive.AddCheckBox(0,i,false,false);

  // Score
    AdvOfficeTabSetChange(AdvOfficeTabSet);
    ShowScore;
  end;

// other forms
  if fSetScore <> nil then fSetScore.selectFrame;
  if fFreeScore <> nil then fFreeScore.selectFrame;
  if fDesigner <> nil then fDesigner.selectFrame;
  end; // if end
end;

procedure TfMain.M_ConnectPathLibraryClick(Sender: TObject);
var libraryAddress, serverAddress : string; clientTmp : boolean;
begin
  clientTmp := fMain.isClient;
  serverAddress := fMain.options.Values['ServerAddress'];

  if isClient then libraryAddress := 'LibraryClientAddress' else libraryAddress := 'LibraryAddress';
  cLibrary.Close;
  if odDatabase.Execute then
  begin
    cLibrary.ConnectionString := AddressToConnectionString(odDatabase.FileName);

    ReadOptions(clientTmp);
    options.Values[libraryAddress] := odDatabase.FileName;
    if libraryAddress = 'LibraryAddress' then options.Values['LibraryClientAddress'] := '';
    WriteOptions(clientTmp, serverAddress);
    ReadOptions(false, false, true);

    nConnectLibraryClick(nil);
  end;
end;

procedure TfMain.M_ConnectPathMatchClick(Sender: TObject);
var matchAddress, serverAddress : string; clientTmp : boolean;
begin
  clientTmp := fMain.isClient;
  serverAddress := fMain.options.Values['ServerAddress'];

  if isClient then matchAddress := 'MatchClientAddress' else matchAddress := 'MatchAddress';
  cMatch.Close;
  if odDatabase.Execute then
  begin
    cMatch.ConnectionString := AddressToConnectionString(odDatabase.FileName);

    ReadOptions(clientTmp);
    options.Values[matchAddress] := odDatabase.FileName;
    if matchAddress = 'MatchAddress' then options.Values['MatchClientAddress'] := '';
    WriteOptions(clientTmp, serverAddress);
    ReadOptions(false, false, true);

    nConnectMatchClick(nil);
  end;
end;

procedure TfMain.M_TarrahReport1Click(Sender: TObject);
begin
  ShowDesignerList(0);
end;
procedure TfMain.M_TarrahReport2Click(Sender: TObject);
begin
  ShowDesignerList(1);
end;
procedure TfMain.M_TarrahReport3Click(Sender: TObject);
begin
  ShowDesignerList(2);
end;

procedure TfMain.M_UserMatchScore1Click(Sender: TObject);
begin
  GetUserMatchScore(0);
end;
procedure TfMain.M_UserMatchScore2Click(Sender: TObject);
begin
  GetUserMatchScore(1);
end;
procedure TfMain.M_UserMatchScore3Click(Sender: TObject);
begin
  GetUserMatchScore(2);
end;

procedure TfMain.B_RefreshClick(Sender: TObject);
begin
  uPicture.ImageIndex := ord(loginGender);
  if isSuperUser then uPicture.ImageIndex := 2;
  Picture.Picture.Bitmap := nil;
  uPicture.Visible := true;

  LName.Caption := '';
  LDescription.Caption := '';
  Label2.Visible := False;
  LAge.Caption := '';
  LFamily.Caption := '';

  ME_Code.Enabled := True;
  userID := '';

  Picture.Refresh;

  if F_TDE <> nil then
  begin
// TDE Code --------------------------------------------------------------------
  if F_TDE <> nil then
  with F_TDE do
  begin
  AdvOfficePager.Enabled := False;

  // Dariaft
    qReceive.Close;

  // Score
    S_Label10.Caption := '0';
    S_Label4.Caption := '0';
    S_Label2.Caption := '0';
    SpinEdit1.Value := 0;
    qScore.Close;
    gScore.Options := gScore.Options - [goEditing];

  // Tahveel
    gDeliver.RowCount := 2;
    gDeliver.ClearRows(1,1);
    qDeliver.Close;

    B_Ok.Enabled := False;
    B_Preview.Enabled := False;
    T_CheckBoxLibrary.Enabled := False;
    T_CheckBoxLibrary.Checked := False;

    Label13.Caption := '';
    Label10.Caption := '';
    Label11.Caption := '';
    Label16.Caption := '';
    Label19.Caption := '';
    Label17.Caption := '';
    Label30.Caption := '';
    Label31.Caption := '';
    LCBook.Caption := '0';
    LCPaint.Caption := '0';
    LCWork.Caption := '0';
    LCCD.Caption := '0';

    MaskEdit1.Text := '';
    MaskEdit2.Text := '';
    MaskEdit4.Text := '';
    MaskEdit6.Text := '';
    if fMain.ICLibrary.Visible then
    begin
      MaskEdit3.Text := '';
      MaskEdit5.Text := '';
    end;

    LCBook.Font.Color := clBlue;
    LCWork.Font.Color := clBlue;
    LCPaint.Font.Color := clBlue;
    LCCD.Font.Color := clBlue;
  end;

// other forms
  if fSetScore <> nil then fSetScore.deselectFrame;
  if fFreeScore <> nil then fFreeScore.deselectFrame;
  if fDesigner <> nil then fDesigner.deselectFrame;
  end; // end if

  if P_User.Visible then
  begin
    ME_Code.SetFocus;
    ME_Code.SelectAll;
  end;
end;

procedure TfMain.B_SearchUserClick(Sender: TObject);
var
  i : Integer;
  F : String;
begin
  P_SearchUser.Visible := not P_SearchUser.Visible;
  if P_SearchUser.Visible then
  begin
    if loginGender = gMale then F := 'WHERE Man = True' else F := 'WHERE Man = False';
    if fMain.isSuperUser then F := '';

    qTmp.SQL.Text := 'SELECT ID, FirstName, LastName FROM Users '+F+' ORDER BY ID';
    qTmp.Open;

    gUser.RowCount := 2;
    gUser.ClearRows(1,1);

    for i := 1 to qTmp.RecordCount do
    begin
      gUser.AddRow;
      qTmp.RecNo := i;

      gUser.Cells[0,i] := qTmp.FieldByName('ID').AsString;
      gUser.Cells[1,i] := qTmp.FieldByName('FirstName').AsString;
      gUser.Cells[2,i] := qTmp.FieldByName('LastName').AsString;
    end;

    gUser.RemoveRows(gUser.RowCount,1);
  end;
end;

procedure TfMain.nFreeScoreClick(Sender: TObject);
var
  i : Integer;
begin
  AdvToolBarPager.Caption.Caption := 'ثبت مسابقه آزاد';

  P_Temp.Visible := True;
  P_User.Visible := True;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fFreeScore = nil then
  begin
    Application.CreateForm(TfFreeScore, fFreeScore);
  end;

  if ICLibrary.Visible then
  begin
    fFreeScore.Label3.Visible := true;
    fFreeScore.MaskEdit2.Visible := true;
  end;

  qTmp.SQL.Text := 'SELECT Caption FROM Groups WHERE Kind = 0 ORDER BY ID';
  qTmp.Open;

  with fFreeScore do
  begin
    CB_Kind.Items.Clear;
    gFreeScore.Columns[3].ComboItems.Clear;
    for i := 1 to qTmp.RecordCount do
    begin
      CB_Kind.Items.Add(qTmp.FieldByName('Caption').AsString);
      gFreeScore.Columns[2].ComboItems.Add(qTmp.FieldByName('Caption').AsString);
      qTmp.Next;
    end;
    CB_Kind.ItemIndex := 0;
  end;

  if userID <> '' then
    fFreeScore.selectFrame
  else ME_Code.SetFocus;

  fFreeScore.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.nDeliverClick(Sender: TObject);
var
  b : Boolean;
begin
  presetMenu;
  P_User.Visible := True;

  if F_TDE = nil then
  begin
    Application.CreateForm( TF_TDE, F_TDE );
    F_TDE.AdvOfficePager.Enabled := False;
  end;

  if ICLibrary.Visible then
  begin
    F_TDE.Label14.Visible := True;
    F_TDE.MaskEdit3.Visible := True;
    F_TDE.T_CheckBoxLibrary.Visible := True;

    F_TDE.Label26.Visible := True;
    F_TDE.MaskEdit5.Visible := True;

    F_TDE.D_CheckBoxLibrary.Visible := True;
  end;

  postsetMenu('تحویل مسابقه', F_TDE);

  b := F_TDE.AdvOfficePager.Enabled;
  F_TDE.AdvOfficePager.Enabled := True;
  F_TDE.AdvOfficePager.ActivePageIndex := 0;
  F_TDE.AdvOfficePager.Enabled := b;
  if userID = '' then ME_Code.SetFocus;
end;

procedure TfMain.nReceiveClick(Sender: TObject);
var
  b : Boolean;
begin
  AdvToolBarPager.Caption.Caption := 'دریافت مسابقه';

  P_Temp.Visible := True;
  P_User.Visible := True;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if F_TDE = nil then
  begin
    Application.CreateForm( TF_TDE, F_TDE );
    F_TDE.AdvOfficePager.Enabled := False;
  end;

  if ICLibrary.Visible then
  begin
    F_TDE.Label14.Visible := True;
    F_TDE.MaskEdit3.Visible := True;
    F_TDE.T_CheckBoxLibrary.Visible := True;

    F_TDE.Label26.Visible := True;
    F_TDE.MaskEdit5.Visible := True;

    F_TDE.D_CheckBoxLibrary.Visible := True;
  end;

  F_TDE.BringToFront;
  P_Temp.Visible := False;

  b := F_TDE.AdvOfficePager.Enabled;
  F_TDE.AdvOfficePager.Enabled := True;
  F_TDE.AdvOfficePager.ActivePageIndex := 1;
  F_TDE.AdvOfficePager.Enabled := b;
  if userID = '' then ME_Code.SetFocus;
end;

procedure TfMain.nPayClick(Sender: TObject);
var
  b : Boolean;
begin
  AdvToolBarPager.Caption.Caption := 'پرداخت امتیاز';

  P_Temp.Visible := True;
  P_User.Visible := True;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if F_TDE = nil then
  begin
    Application.CreateForm( TF_TDE, F_TDE );
    F_TDE.AdvOfficePager.Enabled := False;
  end;

  if ICLibrary.Visible then
  begin
    F_TDE.Label14.Visible := True;
    F_TDE.MaskEdit3.Visible := True;
    F_TDE.T_CheckBoxLibrary.Visible := True;

    F_TDE.Label26.Visible := True;
    F_TDE.MaskEdit5.Visible := True;

    F_TDE.D_CheckBoxLibrary.Visible := True;
  end;

  F_TDE.BringToFront;
  P_Temp.Visible := False;

  b := F_TDE.AdvOfficePager.Enabled;
  F_TDE.AdvOfficePager.Enabled := True;
  F_TDE.AdvOfficePager.ActivePageIndex := 2;
  F_TDE.AdvOfficePager.Enabled := b;
  if userID = '' then ME_Code.SetFocus;
end;

procedure TfMain.nSetScoreClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'تعیین امتیاز مسابقات';

  P_Temp.Visible := True;
  P_User.Visible := True;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fSetScore = nil then
    Application.CreateForm( TfSetScore, fSetScore );

  if userID <> '' then
    fSetScore.selectFrame
  else ME_Code.SetFocus;

  fSetScore.BringToFront;
  P_Temp.Visible :=  False;
end;

procedure TfMain.nDesignerClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'طراحان مسابقه کتاب';

  P_Temp.Visible := True;
  P_User.Visible := True;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fDesigner = nil then
    Application.CreateForm(TfDesigner, fDesigner);

  if userID <> '' then
    fDesigner.selectFrame
  else ME_Code.SetFocus;

  fDesigner.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.nMatchListClick(Sender: TObject);
begin
{x
  AdvToolBarPager.Caption.Caption := 'لیست مسابقات';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fMatchList = nil then
  begin
    Application.CreateForm(TfMatchList, fMatchList);
    fMatchList.CB_MatchChange(nil);
  end;

  fMatchList.BringToFront;
  P_Temp.Visible := False;

  fMatchList.BitBtn1.Down := False;
  fMatchList.Grid.Options := fMatchList.Grid.Options - [goEditing];
  fMatchList.BitBtn1Click(fMatchList.BitBtn1);

  if ( fMain.P_LS.ImageIndex = 2 )or( fMain.P_LS.ImageIndex = 1 ) then
    fMatchList.BitBtn1.Enabled := True
  else
    fMatchList.BitBtn1.Enabled := False;
}
end;

procedure TfMain.nMessageClick(Sender: TObject);
begin
  presetMenu;

  if fMessage = nil then
    Application.CreateForm( TfMessage, fMessage );

  with fMessage do
  begin
    lSource.Caption := fMain.loginUserID;
    lSendDate.Caption := '';
    lSourceRead.Caption := '';
    lName.Caption := '';
    mContentRead.Text := '';
    meDestination.Text := '';

    if AdvOfficeTabSet1.ActiveTabIndex = 0 then
      AdvOfficeTabSet1.OnChange(AdvOfficeTabSet1)
    else AdvOfficeTabSet1.ActiveTabIndex := 0;
  end;

  postsetMenu('پیامها', fMessage);
end;

procedure addGridColumns(grid : TAdvColumnGrid; columns : array of string; strech : integer);
var
  i : integer;
begin
  grid.ColumnSize.Stretch := false;
  grid.Columns.Clear;
  for i := 0 to Length(columns)-1 do
  begin
    grid.Columns.Add;
    grid.Columns[i].Header := columns[i];
    grid.Columns[i].Font.Name := 'B Nazanin';
    grid.Columns[i].Font.Size := 9;
    grid.Columns[i].Font.Style := [fsBold];
    grid.Columns[i].Alignment := taCenter;
    grid.Columns[i].HeaderFont.Name := 'B Nazanin';
    grid.Columns[i].HeaderFont.Size := 8;
    grid.Columns[i].HeaderFont.Style := [fsBold];
    grid.Columns[i].HeaderAlignment := taCenter;
    grid.Columns[i].ReadOnly := true;
  end;
  grid.Columns[strech].Alignment := taLeftJustify;
  grid.Columns[strech].HeaderAlignment := taLeftJustify;
  grid.ColumnSize.StretchColumn := strech;
  grid.ColumnSize.Stretch := true;
end;
procedure TfMain.nResourcesClick(Sender: TObject);
begin
  presetMenu;

  if fMatchList = nil then
    Application.CreateForm(TfMatchList, fMatchList);

  with fMatchList do
  begin
    addGridColumns(Grid, ['', 'عنوان', 'پدید آورنده', 'مرکز نشر', 'نوع', 'رده سنی', 'ایجاد کننده'], 1);
    Grid.Columns[0].Width := 0;
    Grid.Columns[2].Width := 100;
    Grid.Columns[3].Width := 100;
    state := lResource;
    MakeQuery(false, true);
    bNewEntity.Caption := 'منبع جدید';
    bNewEntity.Visible := true;
    bNewQuestionMatch.Visible := true;

    Grid.SearchFooter.Visible := false;
    Grid.Options := Grid.Options - [goEditing];
  end;

  postsetMenu('منابع', fMatchList);
end;

procedure TfMain.nQuestionMatchesClick(Sender: TObject);
begin
  presetMenu;

  if fMatchList = nil then
    Application.CreateForm(TfMatchList, fMatchList);

  with fMatchList do
  begin
    addGridColumns(Grid, ['', 'عنوان', 'رده سنی', 'سوال در صفحه', 'طراح', 'سوالها', 'پاسخها'], 1);
    Grid.Columns[0].Width := 0;
    state := lQuestionMatch;
    MakeQuery(false, true);
    bNewEntity.Visible := false;
    bNewQuestionMatch.Visible := false;

    Grid.SearchFooter.Visible := false;
    Grid.Options := Grid.Options - [goEditing];
  end;

  postsetMenu('مسابقه‌های پرسشی', fMatchList);
end;

procedure TfMain.nInstructionMatchesClick(Sender: TObject);
var
  i : Integer;
begin
  presetMenu;

  if fMatchList = nil then
    Application.CreateForm(TfMatchList, fMatchList);

  with fMatchList do
  begin
    addGridColumns(Grid, ['', 'عنوان', 'رده سنی', 'گروه', 'طراح'], 1);
    Grid.Columns[0].Width := 0;
    state := lInstructionMatch;
    MakeQuery(false, true);
    bNewEntity.Caption := 'مسابقه‌ی دستوری جدید';
    bNewEntity.Visible := true;
    bNewQuestionMatch.Visible := false;

    Grid.SearchFooter.Visible := false;
    Grid.Options := Grid.Options - [goEditing];
  end;

  postsetMenu('مسابقه‌های دستوری', fMatchList);
end;

procedure TfMain.nLogClick(Sender: TObject);
begin
  AdvToolBarPager.Caption.Caption := 'صدور کارنامه';

  P_Temp.Visible := True;
  P_User.Visible := False;
  P_MatchEdit.Visible := False;
  P_SearchUser.Visible := False;

  if fLog = nil then
    Application.CreateForm(TfLog, fLog);

  fLog.CB_MatchChange(nil);
  fLog.BringToFront;
  P_Temp.Visible := False;
end;

procedure TfMain.PassWordEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then bLogin.Click;
end;

procedure TfMain.GetUserMatchScore( F : Integer );
var
  SQ, ageCondition, beyt, ftitle : String;
begin
  ageCondition := 'AND '+ LeftStr(getShamsiDate, 4) +'-CInt(Left(BirthDate,4)) ';

  SQ := 'SELECT usrTmp.ID, LastName, FirstName, ScoreSum, ScoreCount, AvgQuality FROM (SELECT * FROM Users WHERE CONVERT(Left(BirthDate, 4), SIGNED)) AS usrTmp LEFT JOIN '+ sqlUserScores() +' ON usrTmp.ID = UserScores.ID WHERE ScoreSum > 0 ';
  case F of
    1 : SQ := SQ + ageCondition + '<='+ options.Values['ChildAge'];
    2 : SQ := SQ + ageCondition + '>'+ options.Values['ChildAge'];
  end;
  SQ := SQ + ' ORDER BY ScoreSum DESC';

  ftitle := 'ليست امتيازات مسابقه';
  case F of
    1 : ftitle := ftitle + ' - نو نهالان';
    2 : ftitle := ftitle + ' - بزرگسالان';
  end;

  listHeader[0] := 'رتبه'; listField[0] := '[Line]'; listWidth[0] := 35;
  listHeader[1] := 'کد'; listField[1] := '[fdList."ID"]'; listWidth[1] := 80;
  listHeader[2] := 'نام خانوادگی'; listField[2] := '[fdList."LastName"]'; listWidth[2] := 0;
  listHeader[3] := 'تعداد مسابقه'; listField[3] := '[fdList."ScoreCount"]'; listWidth[3] := 100;
  listHeader[4] := 'کیفیت'; listField[4] := '[fdList."AvgQuality"]'; listWidth[4] := 100;
  listHeader[5] := 'امتیاز'; listField[5] := '[fdList."ScoreSum"]'; listWidth[5] := 100;
  beyt := 'در این درگه که گه‌گه، کَه کُه و کُه کَه شود ناگه               به امروزت مشو غرّه که از فردا نه‌ای آگه';
  MakeFastList(SQ, ftitle, beyt, 6, 2);
end;

procedure TfMain.ShowDesignerList( I : Integer );
var
  SQ, tmpMan, title : String;
begin
  title := 'لیست طراحان';

  tmpMan := '';
  if I = 1 then
  begin
    tmpMan := 'WHERE Man = True ';
    title := title + ' - آقایان';
  end else if I = 2 then
  begin
    tmpMan := 'WHERE Man = False ';
    title := title + ' - خانمها';
  end;

  SQ := 'SELECT Users.ID, LastName, Phone, CountOfMatch, CountOfQuestion, CountOfAnswer, Corrected, Uncorrected '+
  'FROM ((Users INNER JOIN (SELECT DesignerID, Count(ID) AS CountOfMatch FROM Matches GROUP BY Matches.DesignerID) AS tMatch ON Users.ID = tMatch.DesignerID) '+
  'LEFT JOIN (SELECT DesignerID, Count(Question) AS CountOfQuestion, Count(Answer) AS CountOfAnswer FROM Matches INNER JOIN Questions ON Matches.ID = Questions.MatchID GROUP BY DesignerID) AS tQuestion ON Users.ID = tQuestion.DesignerID) '+
  'LEFT JOIN (SELECT DesignerID, Count(ReceiveDate)-Count(ScoreDate) AS Uncorrected, Count(ScoreDate) AS Corrected FROM Transactions INNER JOIN Matches ON Transactions.MatchID = Matches.ID '+
    'WHERE DeliverDate Is Not Null AND DeliverDate > "'+ options.Values['BeginDate'] +'" GROUP BY DesignerID) AS tTransaction ON Users.ID = tTransaction.DesignerID '+
  tmpMan + 'ORDER BY CountOfMatch DESC, CountOfQuestion DESC, CountOfAnswer DESC, Corrected DESC, Uncorrected DESC';

  listHeader[0] := 'ردیف'; listField[0] := '[Line]'; listWidth[0] := 35;
  listHeader[1] := 'کد'; listField[1] := '[fdList."ID"]'; listWidth[1] := 60;
  listHeader[2] := 'نام خانوادگی'; listField[2] := '[fdList."LastName"]'; listWidth[2] := 0;
  listHeader[3] := 'مسابقه‌ها'; listField[3] := '[fdList."CountOfMatch"]'; listWidth[3] := 70;
  listHeader[4] := 'سوالها'; listField[4] := '[fdList."CountOfQuestion"]'; listWidth[4] := 70;
  listHeader[5] := 'پاسخها'; listField[5] := '[fdList."CountOfAnswer"]'; listWidth[5] := 70;
  listHeader[6] := 'تصحیح شده'; listField[6] := '[fdList."Corrected"]'; listWidth[6] := 100;
  listHeader[7] := 'تصحیح نشده'; listField[7] := '[fdList."Uncorrected"]'; listWidth[7] := 100;
//  listHeader[8] := 'شماره تماس'; listField[8] := '[fdList."Phone"]'; listWidth[8] := 100;
  MakeFastList(SQ, title, '', 8, 2);
end;

procedure TfMain.MakeFastList(sql, titleText, footerText : string; lLength, rightAlign, moveRight : integer);
var
	DataPage: TfrxDataPage;
	Page: TfrxReportPage;
	Band: TfrxBand;
	DataBand: TfrxMasterData;
	Memo: TfrxMemoView;
	Header : TfrxPageHeader;
	Footer : TfrxPageFooter;

  FullWidth, FitWidth, RowHeight, i, leftTemp : Integer;
begin
  if sql <> '' then
  begin
    qfList.SQL.Text := sql;
    qfList.Open;
  end;

	FullWidth := 718;
  RowHeight := 22;
  FitWidth := FullWidth - 20;

  frxReport.Clear;
  frxReport.DataSets.Add(fdList);
	DataPage := TfrxDataPage.Create(frxReport);
  Page := TfrxReportPage.Create(frxReport);
	with Page do
  begin
	  CreateUniqueName;
	  SetDefaults;
  end;

// Title
	Band := TfrxReportTitle.Create(Page);
  with Band do
  begin
	  CreateUniqueName;
	  Height := 50;
  end;

	Memo := TfrxMemoView.Create(Band);
	with Memo do
	begin
		CreateUniqueName;
		Height := Band.Height;
		Align := baClient;
		ShiftMode := smDontShift;
		Font.Name := 'B Jadid';
		Font.Height := -24;
		HAlign := haCenter;
		VAlign := vaCenter;
		Text := titleText;
	end;

	Header := TfrxPageHeader.Create(Page);
	with Header do
	begin
		CreateUniqueName;
		Top := 100;
		Height := 30;
		Width := FullWidth;
	end;
	Memo := TfrxMemoView.Create(Header);
	with Memo do
	begin
		CreateUniqueName;
    Align := baCenter;
		ShiftMode := smDontShift;
		Width := FitWidth;
		Height := 26;
		Frame.Typ := [ftBottom];
		Frame.Width := 1.2;
		Style := 'Header line';
	end;

	DataBand := TfrxMasterData.Create(Page);
	with DataBand do
	begin
		CreateUniqueName;
    DataSet := fdList;
		Height := RowHeight;
		Top := 200;
		Width := FullWidth;
	end;
	Memo := TfrxMemoView.Create(DataBand);
	with Memo do
	begin
		CreateUniqueName;
		Align := baCenter;
		ShiftMode := smDontShift;
    Top := 2;
		Width := FitWidth;
		Height := RowHeight;
		Highlight.Color := 15790320;
		Highlight.Condition := '<Line#> mod 2';
  end;

  if footerText <> '' then
  begin
		Footer := TfrxPageFooter.Create(Page);
		with Footer do
		begin
      CreateUniqueName;
  		Height := 20;
	  	Top := 300;
		  Width := FullWidth;
		end;

		Memo := TfrxMemoView.Create(Footer);
		with Memo do
		begin
      CreateUniqueName;
			Align := baCenter;
			ShiftMode := smDontShift;
			Width := FitWidth;
			Height := 20;
			Font.Height := -13;
			Font.Name := 'B Nazanin';
			Font.Style := [];
			Frame.Typ := [ftTop];
			Frame.Width := 1.2;
			HAlign := haCenter;
			RTLReading := True;
			Text := footerText;
		end;
  end;

  leftTemp := 0;
  for i := 0 to lLength-1 do
    leftTemp := leftTemp + listWidth[i];
  listWidth[rightAlign] := FitWidth - leftTemp;

  leftTemp := FullWidth - (FullWidth-FitWidth) div 2 + moveRight;
  for i := 0 to lLength-1 do
  begin
    leftTemp := leftTemp - listWidth[i];

		// Header
		Memo := TfrxMemoView.Create(Header);
		with Memo do
		begin
			CreateUniqueName;
		  ShiftMode := smDontShift;
			Font.Height := -16;
			Font.Name := 'B Nazanin';
			Font.Style := [fsBold];
			RTLReading := True;
			Height := 24;

			if i = rightAlign then HAlign := haRight else HAlign := haCenter;
			Left := leftTemp;
			Width := listWidth[i];
			Text := listHeader[i];
		end;

		// Data
		Memo := TfrxMemoView.Create(DataBand);
		with Memo do
		begin
			CreateUniqueName;
			ShiftMode := smDontShift;
			Font.Height := -16;
			Font.Name := 'B Nazanin';
			Font.Style := [];
			RTLReading := True;
			Height := RowHeight;

      if i = rightAlign then HAlign := haRight else HAlign := haCenter;
			Left := leftTemp;
			Width := listWidth[i];
		  Text := listField[i];
		end;
  end;

	frxReport.ShowReport;
end;

// sync
procedure TfMain.syncDatabase();
var uniqueID, syncDate, libraryID : string;

procedure executeGlobalCommand(s : string);
begin
  myGlobalCommand.SQL.Text := s;
  myGlobalCommand.Execute;
end;

function syncTable(upload : boolean; tableName : string; keyFields, syncFields : array of string) : boolean;
var all, exists, notexists, keyField, keyChr, fieldString : string; fieldCount, keyCount : integer;
    cmd, tmp : string; i, j : integer;

procedure initVars();
var j : integer;
begin
  keyCount := Length(keyFields) - 1;
  if keyCount = 0 then
  begin
    keyChr := '';
    keyField := keyFields[0];
  end else
  begin
    keyChr := '"';
    keyField := 'CONCAT(';
    for j := 0 to keyCount do
    begin
      keyField := keyField + keyFields[j];
      if j <> keyCount then keyField := keyField + ',"-",';
    end;
    keyField := keyField + ')';
  end;
  fieldCount := Length(syncFields) - 1; fieldString := '';
  for j := 0 to keyCount do fieldString := fieldString + keyFields[j] + ',';
  for j := 0 to fieldCount do
  begin
    fieldString := fieldString + syncFields[j];
    if j <> fieldCount then fieldString := fieldString + ',';
  end;
end;

var allCond, existsCond : string; srcQuery, dstQuery : TMyQuery; srcCommand, dstCommand : TMyCommand;
procedure loopTemp();
var i, j : integer; tmpUpdate : string;
begin
  if upload then
  begin
    tmp := '';
    for j := 0 to keyCount do
    begin
      tmp := tmp + keyFields[j] +'=:'+ keyFields[j];
      if j <> keyCount then tmp := tmp + ' AND ';
    end;
    srcCommand.SQL.Text := 'UPDATE '+ tableName +' SET CAS = 0, SyncDate = "'+ getShamsiDate +'" WHERE '+ tmp;
  end;

  for i := 1 to srcQuery.RecordCount do
  begin
    for j := 0 to keyCount do dstCommand.ParamValues[keyFields[j]] := srcQuery.Fields[j].AsVariant;
    for j := 0 to fieldCount do dstCommand.ParamValues[syncFields[j]] := srcQuery.Fields[j+keyCount+1].AsVariant;
    dstCommand.Execute;

    if upload then
    begin
      for j := 0 to keyCount do srcCommand.ParamValues[keyFields[j]] := srcQuery.Fields[j].AsVariant;
      srcCommand.Execute;
    end;
    srcQuery.Next;
  end;
end;

procedure fillAll();
var i : integer;
begin
  all := '';
  for i := 1 to srcQuery.RecordCount do
  begin
    all := all + keyChr + srcQuery.Fields[0].AsString + keyChr;
    if i <> srcQuery.RecordCount then all := all + ',';
    srcQuery.Next;
  end;
end;
function getKeyCond() : string;
var j : integer;
begin
  Result := 'WHERE ';
  if upload then Result := Result + 'LibraryID = '+ libraryID + ' AND ';
  for j := 0 to keyCount do
  begin
    Result := Result + keyFields[j] +'=:'+ keyFields[j];
    if j <> keyCount then Result := Result + ' AND ';
  end;
end;

begin
  Result := false;
  if upload then
  begin
    srcQuery := myQuery; srcCommand := myCommand;
    dstQuery := myGlobalQuery; dstCommand := myGlobalCommand;
    allCond := 'CAS = 1';
  end else
  begin
    srcQuery := myGlobalQuery; srcCommand := myGlobalCommand;
    dstQuery := myQuery; dstCommand := myCommand;
    allCond := 'ChangeDate > "'+ syncDate +'"';
  end;
  initVars;

  // generate arrays
  srcQuery.SQL.Text := 'SELECT '+ keyField +' FROM '+ tableName +' WHERE '+ allCond;
  srcQuery.Open;
  fillAll;

  exists := '';
  if all <> '' then
  begin
    dstQuery.SQL.Text := 'SELECT '+ keyField +' FROM '+ tableName +' WHERE ';
    if upload then dstQuery.SQL.Text := dstQuery.SQL.Text + 'LibraryID = '+ libraryID +' AND ';
    dstQuery.SQL.Text := dstQuery.SQL.Text + keyField +' IN ('+ all +')';
    dstQuery.Open;
    for i := 1 to dstQuery.RecordCount do
    begin
      exists := exists + keyChr + dstQuery.Fields[0].AsString + keyChr;
      if i <> dstQuery.RecordCount then exists := exists + ',';
      dstQuery.Next;
    end;
    dstQuery.Close;
  end;

  // UPDATE exists
  if exists <> '' then
  begin
    Result := true;
    cmd := 'UPDATE '+ tableName + ' SET ';
    for j := 0 to fieldCount do
    begin
      cmd := cmd + syncFields[j] + '=:' + syncFields[j];
      if j <> fieldCount then cmd := cmd + ',';
    end;
    dstCommand.SQL.Text := cmd + ' ' + getKeyCond + ';';

    srcQuery.SQL.Text := 'SELECT '+ fieldString +' FROM '+ tableName +' WHERE '+ allCond +' AND '+ keyField +' IN ('+ exists +')';
    srcQuery.Open;
    loopTemp;
  end;

  // INSERT all - exists
  cmd := 'INSERT INTO '+ tableName +' (';
  if upload then cmd := cmd + 'LibraryID,' else cmd := cmd + 'SyncDate,';
  cmd := cmd + fieldString + ') VALUES (';
  if upload then cmd := cmd + libraryID + ',' else cmd := cmd + '"' + getShamsiDate + '",';

  for j := 0 to keyCount do cmd := cmd +':'+ keyFields[j] +',';
  for j := 0 to fieldCount do
  begin
    cmd := cmd +':'+ syncFields[j];
    if j <> fieldCount then cmd := cmd + ',';
  end;
  dstCommand.SQL.Text := cmd + ');';

  if exists <> '' then tmp := ' AND '+ keyField +' NOT IN ('+ exists +')' else tmp := '';
  srcQuery.SQL.Text := 'SELECT '+ fieldString +' FROM '+ tableName +' WHERE '+ allCond + tmp;
  srcQuery.Open;
  if srcQuery.RecordCount > 0 then
  begin
    Result := true;
    loopTemp;
  end;

  // DELETE
  srcQuery.SQL.Text := 'SELECT COUNT(*) FROM '+ tableName;
  srcQuery.Open;
  dstQuery.SQL.Text := 'SELECT COUNT(*) FROM '+ tableName;
  if upload then dstQuery.SQL.Text := dstQuery.SQL.Text + ' WHERE LibraryID = '+ libraryID;
  dstQuery.Open;

  if srcQuery.Fields[0].AsInteger < dstQuery.Fields[0].AsInteger then
  begin
    Result := true;
    srcQuery.SQL.Text := 'SELECT '+ keyField +' FROM '+ tableName;
    srcQuery.Open;
    fillAll;

    tmp := '';
    for j := 0 to keyCount do
    begin
      tmp := tmp + keyFields[j];
      if j <> keyCount then tmp := tmp + ',';
    end;
    cmd := 'DELETE FROM '+ tableName + ' WHERE ';
    if upload then cmd := cmd + 'LibraryID = '+ libraryID + ' AND ';
    dstCommand.SQL.Text := cmd + keyField +' NOT IN ('+ all +');';
    dstCommand.Execute;
  end;
end;

{
procedure uploadTable(tableName : string; keyFields, syncFields : array of string);

function getQuestionSQL(matchID : string) : string;
var k : byte;
function getNormalValue(s : string) : string;
begin
  if s = '' then Result := 'NULL' else Result := '"'+ s +'"';
end;
begin
  Result := 'DELETE FROM qustions WHERE LibraryID = '+ libraryID +' AND MatchID = '+ matchID + '; ';
  myQueryTmp.SQL.Text := 'SELECT * FROM Questions WHERE MatchID = '+ matchID;
  myQueryTmp.Open;
  if myQueryTmp.RecordCount > 0 then
  begin
    Result := Result +'INSERT INTO qustions (LibraryID,MatchID,ID,Question,Answer) VALUES ';
    for k := 1 to myQueryTmp.RecordCount do
    begin
      Result := Result +'('+ libraryID +','+ myQueryTmp.Fields[0].AsString +','+ myQueryTmp.Fields[1].AsString +','+ getNormalValue(myQueryTmp.Fields[2].AsString) +','+ getNormalValue(myQueryTmp.Fields[3].AsString) +')';
      if k <> myQueryTmp.RecordCount then Result := Result + ',';
      myQueryTmp.Next;
    end;
    Result := Result + ';';
  end;
end;

procedure loopTempUp();
var i, j : integer; isMatch : boolean; tmpUpdate : string;
begin
  tmp := '';
  for j := 0 to keyCount do
  begin
    tmp := tmp + keyFields[j] +'=:'+ keyFields[j];
    if j <> keyCount then tmp := tmp + ' AND ';
  end;
  myCommand.SQL.Text := 'UPDATE '+ tableName +' SET CAS = False, SyncDate = "'+ getShamsiDate +'" WHERE '+ tmp;

  isMatch := tableName = 'matches';
  for i := 1 to myQuery.RecordCount do
  begin
    for j := 0 to keyCount do myGlobalCommand.ParamValues[keyFields[j]] := myQuery.Fields[j].AsVariant;
    for j := 0 to fieldCount do myGlobalCommand.ParamValues[syncFields[j]] := myQuery.Fields[j+keyCount+1].AsVariant;
    myGlobalCommand.Execute;
    if isMatch then executeGlobalCommand(getQuestionSQL(myQuery.FieldByName('ID').AsString));

    for j := 0 to keyCount do myCommand.ParamValues[keyFields[j]] := myQuery.Fields[j].AsVariant;
    myCommand.Execute;
    myQuery.Next;
  end;
end;
}

procedure uploadLibrary();
begin
  myQuery.SQL.Text := 'SELECT * FROM Library';
  myQuery.Open;
  uniqueID := myQuery.FieldByName('UniqueID').AsString;
  if uniqueID = '' then
  begin
    uniqueID := getComputerID(true);
    executeCommand('UPDATE library SET UniqueID = "'+ uniqueID +'";');
  end;

  myGlobalQuery.SQL.Text := 'SELECT * FROM libraries WHERE UniqueID = "'+ uniqueID +'"';
  myGlobalQuery.Open;

  if myGlobalQuery.RecordCount = 0 then
  begin
    libraryID := ''; syncDate := '';
    myGlobalCommand.SQL.Text := 'INSERT INTO libraries (Title, UniqueID, ServerID, Licence) VALUES (:Title, :UniqueID, :ServerID, :Licence)';
  end else
  begin
    libraryID := myGlobalQuery.FieldByName('ID').AsString;
    syncDate := myGlobalQuery.FieldByName('SyncDate').AsString;
    myGlobalCommand.SQL.Text := 'UPDATE libraries SET Title = :Title, UniqueID = :UniqueID, ServerID = :ServerID, Licence = :Licence WHERE ID = '+ libraryID;
  end;
  if myQuery.FieldByName('CAS').AsBoolean then
  begin
    myGlobalCommand.ParamValues['Title'] := myQuery.FieldByName('Title').AsVariant;
    myGlobalCommand.ParamValues['UniqueID'] := myQuery.FieldByName('UniqueID').AsVariant;
    myGlobalCommand.ParamValues['ServerID'] := myQuery.FieldByName('ServerID').AsVariant;
    myGlobalCommand.ParamValues['Licence'] := myQuery.FieldByName('Licence').AsVariant;
    myGlobalCommand.Execute;
    if libraryID = '' then libraryID := IntToStr(myGlobalCommand.InsertId);
  end;
end;

var tags : string; i : integer;
begin
  uploadLibrary();
  // download
  syncTable(false, 'sentences', ['ID'], ['Sentence']);
  syncTable(false, 'categories', ['ID'], ['Title', 'Description', 'BeginAge', 'EndAge']);

  // upload
  syncTable(true, 'freescores', ['ID'], ['UserID', 'GroupID', 'Title', 'Score', 'ScoreDate', 'OperatorID']);
  syncTable(true, 'users', ['ID'], ['FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Man', 'RegisterDate', 'Description', 'Permission']);
  syncTable(true, 'messages', ['ID'], ['SourceID', 'DestinationID', 'Content', 'SendDate', 'Viewed']);
  syncTable(true, 'payments', ['ID'], ['UserID', 'Score', 'ScoreDate', 'OperatorID']);
  syncTable(true, 'pictures', ['ID'], ['Picture']);
  syncTable(true, 'groups', ['ID'], ['Caption']);
  syncTable(true, 'transactions', ['UserID', 'MatchID'], ['DeliverDate', 'ReceiveDate', 'Rate', 'Score', 'ScoreDate', 'OperatorID']);

// matches questions resources entities supports
//  uploadTable('matches', ['ID'], ['DesignerID', 'Title', 'MaxScore', 'Age', 'State', 'QPPaper', 'Tags', 'Content', 'PictureConfiguration', 'GenuineID']);

  if syncTable(false, 'tags', ['Kind', 'ID'], ['Caption']) then
  begin
    tags := '';
    myQuery.SQL.Text := 'SELECT Caption FROM tags ORDER BY Kind, ID;';
    myQuery.Open;
    for i := 1 to myQuery.RecordCount do
    begin
      tags := tags + '"' + myQuery.Fields[0].AsString + '"';
      if i <> myQuery.RecordCount then tags := tags + ', ';
      myQuery.Next;
    end;

    myCommand.SQL.Text := 'ALTER TABLE entities MODIFY Tags SET('+ tags +') DEFAULT NULL;';
    myCommand.Execute;
  end;
  executeGlobalCommand('UPDATE libraries SET SyncDate = "'+ getShamsiDate +'" WHERE ID = '+ libraryID);
end;

end.

