unit UnitWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, AdvAppStyler, AdvGlowButton, StdCtrls, AdvGroupBox,
  ExtCtrls, DB, ADODB, WebPost, ShellApi, Grids, BaseGrid,
  AdvGrid, OleCtrls, AdvCGrid, AdvProgressBar, //CHILKATUPLOADLib_TLB,
  xmldom, XMLIntf, msxmldom, XMLDoc, StrUtils, xercesxmldom, DBCtrls,
  ComCtrls, AdvListV, AdvOfficeButtons, UnitMaster, WebCopy, DBAccess, MyAccess;

type
  TUpKind = record
    Name, FileName, SQL, sqlCount, sqlUpdate, sqlWCheck, sqlWDate : string;
  end;

  TF_Web = class(TMaster)
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AQ1: TADOQuery;
    aqXML: TADOQuery;
    pWeb: TAdvPanel;
    AdvGroupBox1: TAdvGroupBox;
    AdvGroupBox4: TAdvGroupBox;
    gSend: TAdvGroupBox;
    AdvGlowButton1: TAdvGlowButton;
    sGrid: TAdvColumnGrid;
    chPicture: TAdvOfficeCheckBox;
    UpdateCommand: TADOCommand;
    chUpdateQuery: TAdvOfficeCheckBox;
    AdvGroupBox6: TAdvGroupBox;
    ePort: TEdit;
    eServer: TEdit;
    eAction: TEdit;
    chAll: TAdvOfficeCheckBox;
    aqTemp: TADOQuery;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    SaveDialog1: TSaveDialog;

    procedure SQL2XML( sql, filename : string; index : integer );
    function Index2XML( index : integer ) : string;
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure RefreshGrid();
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure sGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
  public
    upFiles : TStringList;
    sendFileName : string;
    MatchID : String;
  end;

var
  F_Web: TF_Web;
  upObject : array[1..20] of TUpKind;
  Count : Integer;

implementation

uses UnitMain;

{$R *.dfm}

procedure TF_Web.RefreshGrid();
var
  i : integer;
begin
  with upObject[1] do
  begin
    Name := 'اطلاعات مسابقه';
    FileName := 'Library';
    SQL := 'SELECT Options.MatchID, Options.MatchPicture AS PI, Options.MatchTitle, Options.MatchDate FROM Options ';
    sqlCount := 'SELECT Count(Options.MatchID) AS CountOfMatchID FROM Options ';
    sqlUpdate := ''; sqlWCheck := ''; sqlWDate := '';
  end;

  with upObject[2] do
  begin
    Name := 'اطلاعات اعضا';
    FileName := 'User';
    SQL := 'SELECT Users.ID AS I, Users.Name AS N, Users.Family AS F, Users.T_T AS T, Users.Adress AS A, Users.Phon AS P, Users.[Is Men] AS IM, Users.Picture AS PI, Users.Description AS D, Users.WebPassword AS W FROM Users ';
    sqlCount := 'SELECT Count(Users.ID) FROM Users ';
    sqlUpdate := 'UPDATE Users SET Users.WebUpdate = "'+ fMain.getShamsiDate +'" ';
    sqlWCheck := '';
    sqlWDate := ' WHERE (((Users.WebUpdate)<[Users]![Reg Date] Or (Users.WebUpdate) Is Null))';
  end;

  with upObject[3] do
  begin
    Name := 'اطلاعات مسابقات';
    FileName := 'Match';
    SQL := 'SELECT MatchInfo.MatchID AS I, MatchInfo.GroupID AS G, MatchInfo.BookID AS B, MatchInfo.DesignerID AS D, MatchInfo.MaxScore AS M, MatchInfo.Title AS T, MatchInfo.FitAge AS FA, MatchInfo.QPP AS QP, MatchInfo.State AS K, '+
           'Q_BookQuestion.[CountOfQuestion] AS QS, Q_BookAnswers.CountOfAnswer AS [AS], BookInfo.Author AS A, BookInfo.Publication AS P, Content.Memo AS ME, Content.Picture AS PI, '+
           'IIf((Left([MatchInfo]![GroupID],1)="2" Or Left([MatchInfo]![GroupID],1)="3") AND Content![Height] IS NOT NULL,CStr(Content![Height])+"-"+CStr(Content![Width])+"-"+CStr(Content![Top])+"-"+CStr(Content![Left]),"") AS S '+
           'FROM (((MatchInfo LEFT JOIN BookInfo ON MatchInfo.MatchID = BookInfo.[Match ID]) LEFT JOIN Content ON MatchInfo.MatchID = Content.[Match ID]) LEFT JOIN Q_BookQuestion ON '+
           'MatchInfo.MatchID = Q_BookQuestion.MatchID) LEFT JOIN Q_BookAnswers ON MatchInfo.MatchID = Q_BookAnswers.MatchID ';
    sqlCount := 'SELECT Count(MatchInfo.MatchID) FROM MatchInfo ';
    sqlUpdate := 'UPDATE MatchInfo SET MatchInfo.WebUpdate = "'+ fMain.getShamsiDate +'" ';
    sqlWCheck := '';
    sqlWDate := ' WHERE ((MatchInfo.WebUpdate Is Null) OR ((MatchInfo.WebUpdate)<[MatchInfo]![ChangeDate]))';
  end;

  with upObject[4] do
  begin
    Name := 'سوالهای مسابقات کتاب و چند رسانه‌ای';
    FileName := 'Question';
    SQL := 'SELECT Question.MatchID AS I, Question.Question AS Q, Question.Answer AS A FROM Question INNER JOIN MatchInfo ON Question.MatchID = MatchInfo.MatchID';
    sqlCount := 'SELECT Count(Question.MatchID) FROM Question INNER JOIN MatchInfo ON Question.MatchID = MatchInfo.MatchID';
    sqlUpdate := '';
    sqlWCheck := ' WHERE (MatchInfo.Own = true) AND (MatchInfo.State = 0) ';
    sqlWDate := ' AND ((MatchInfo.WebUpdate Is Null) Or (MatchInfo.WebUpdate < MatchInfo.ChangeDate)) ';
  end;

  with upObject[5] do
  begin
    Name := 'اطلاعات کامل برگزاری مسابقات پس از تاریخ شروع';
    FileName := 'Log';
    SQL := 'SELECT Cash.[Student Code] AS I, Cash.[Examin Code] AS E, Cash.D_Emtiaz AS D, Q_MatchScore.Score AS S '+
           'FROM Cash INNER JOIN Q_MatchScore ON (Cash.[Examin Code] = Q_MatchScore.MatchID) AND (Cash.[Student Code] = Q_MatchScore.[Student Code]) ';
    sqlCount := 'SELECT Count(Cash.[Student Code]) FROM Cash INNER JOIN Q_MatchScore ON (Cash.[Examin Code] = Q_MatchScore.MatchID) AND (Cash.[Student Code] = Q_MatchScore.[Student Code]) ';
    sqlUpdate := 'UPDATE Cash INNER JOIN Q_MatchScore ON (Cash.[Student Code] = Q_MatchScore.[Student Code]) AND (Cash.[Examin Code] = Q_MatchScore.MatchID) SET Cash.WebUpdate = "'+ fMain.getShamsiDate +'" ';
    sqlWCheck := '';
    sqlWDate := ' WHERE (((Cash.WebUpdate) Is Null)) OR (((Cash.WebUpdate)<[Cash]![D_Emtiaz]))';
  end;

  with upObject[6] do
  begin
    Name := 'امتیازات پرداخت شده';
    FileName := 'Payment';
    SQL := 'SELECT ScoreCash.Student AS I, ScoreCash.Score AS S, ScoreCash.Date AS D, ScoreCash.RID AS RI FROM ScoreCash ';
    sqlCount := 'SELECT Count(ScoreCash.Student) AS CountOfStudent FROM ScoreCash ';
    sqlUpdate := 'UPDATE ScoreCash SET ScoreCash.WebUpdate = "'+ fMain.getShamsiDate +'" ';
    sqlWCheck := '';
    sqlWDate := ' WHERE (((ScoreCash.WebUpdate) Is Null Or (ScoreCash.WebUpdate)<[ScoreCash]![Date]))';
  end;

  with upObject[7] do
  begin
    Name := 'مسابقات آزاد';
    FileName := 'Free';
    SQL := 'SELECT Resume.ID AS I, Resume.ObjectName AS O, Resume.Kind AS K, Resume.Score AS S, Resume.Date AS D, Resume.RID AS RI FROM Resume ';
    sqlCount := 'SELECT Count(Resume.ID) FROM Resume ';
    sqlUpdate := 'UPDATE Resume SET Resume.WebUpdate = "'+ fMain.getShamsiDate +'" ';
    sqlWCheck := '';
    sqlWDate := ' WHERE (((Resume.WebUpdate) Is Null Or (Resume.WebUpdate)<[Resume]![Date]))';
  end;

  with upObject[8] do
  begin
    Name := 'جملات';
    FileName := 'Sentence';
    SQL := 'SELECT Jomle.Jomle AS J, Jomle.Goyandeh AS G FROM Jomle ';
    sqlCount := 'SELECT Count(Jomle.Jomle) AS CountOfJomle FROM Jomle ';
    sqlUpdate := ''; sqlWCheck := ''; sqlWDate := '';
  end;

  with upObject[9] do
  begin
    Name := 'زیر گروه ها';
    FileName := 'SubGroup';
    SQL := 'SELECT SubGroup.ID AS I, SubGroup.Caption AS C FROM SubGroup ';
    sqlCount := 'SELECT Count(SubGroup.ID) FROM SubGroup ';
    sqlUpdate := ''; sqlWCheck := ''; sqlWDate := '';
  end;

  Count := 9;

  SGrid.RemoveRows( 2, SGrid.RowCount-2 );
  SGrid.ClearRows( 1, 1 );

  for i := 1 to Count do
  begin
    sGrid.AddRow;
    sGrid.Cells[3,i] := upObject[i].Name;
    if upObject[i].sqlCount <> '' then
    begin
      AQ1.SQL.Text := upObject[i].sqlCount + upObject[i].sqlWCheck + upObject[i].sqlWDate + ';';
      AQ1.Open;
      sGrid.Cells[1,i] := AQ1.Fields[0].AsString;

      AQ1.SQL.Text := upObject[i].sqlCount + upObject[i].sqlWCheck + ';';
      AQ1.Open;
      sGrid.Cells[2,i] := AQ1.Fields[0].AsString;
    end;
    sGrid.AddCheckBox(0, i, false, false);
  end;
  sGrid.RemoveRows(Count+1,1);
end;

procedure TF_Web.sGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
  st : Boolean;
begin
  sGrid.GetCheckBoxState(0, 3, st);
  sGrid.SetCheckBoxState(0, 4, st);
end;

procedure TF_Web.AdvGlowButton2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    CopyFile(PWideChar(fMain.sendFolderAddress + sendFileName), PWideChar(fMain.AddExtension(SaveDialog1.FileName, '.send')), LongBool(0));
end;

procedure TF_Web.AdvGlowButton3Click(Sender: TObject);
var
  i, plus : integer;
  fn : string;
  state : boolean;
begin
  plus := 0;
  for i := 1 to Count do
  begin
    sGrid.GetCheckBoxState(0,i, State);
    if State then plus := plus +1;
  end;

  if plus = 0 then
  begin
    fMain.MyShowMessage('لطفا بخشی از مسابقات را برای آماده‌سازی انتخاب کنید');
    Abort;
  end;

  fMain.ProgressBegin('آماده‌سازی فایلها', plus);

  upFiles.Clear;
  for i := 1 to Count do
  begin
    sGrid.GetCheckBoxState(0,i, State);
    if State then
    begin
      fn := Index2XML(i);
      upFiles.Add(fn);
      if chUpdateQuery.Checked then
      if upObject[i].sqlUpdate <> '' then
      begin
        if chAll.Checked then
          UpdateCommand.CommandText := upObject[i].sqlUpdate + upObject[i].sqlWCheck + ';'
        else
          UpdateCommand.CommandText := upObject[i].sqlUpdate + upObject[i].sqlWCheck + upObject[i].sqlWDate + ';';
        UpdateCommand.Execute;
      end;
      fMain.ProgressContinue;
    end;
  end;

  if FileExists(fMain.sendFolderAddress + sendFileName) then
    DeleteFile(fMain.sendFolderAddress + sendFileName);
{
  with fMain.zipMaster do
  begin
    Clear;
    Password := 'abrdmkazhdpkzsrst';
    AddOptions := AddOptions + [AddEncrypt];
    ZipFileName := fMain.sendFolderAddress + sendFileName;
    FSpecArgs.AddStrings(upFiles);
    Add;
  end;
  for i := 0 to upFiles.Count-1 do DeleteFile(upFiles.Strings[i]);
}
  gSend.Height := 50;
  fMain.ProgressEnd;
end;

procedure TF_Web.AdvGlowButton4Click(Sender: TObject);
var
  i : integer;
  fn : string;
begin
{  Upload.Hostname := eServer.Text; //'www.chilkatsoft.com';
  Upload.Path := eAction.Text; //'/receiveUpload.aspx';
  Upload.Port := StrToInt(ePort.Text);

  Upload.Refresh;
  Upload.AddFileReference(sendFileName, fMain.sendFolderAddress + sendFileName);

  //  Begin the HTTP upload in a background thread:
  if upload.BeginUpload <> 1 then
    fMain.MyShowMessage('فرایند ارسال نمی تواند آغاز شود')
  else
  begin
    fMain.ProgressBegin('ارسال اطلاعات', false);

    try
      while upload.UploadInProgress = 1 do
      begin
        fMain.msgProgress.ProgressValue := upload.PercentUploaded;
        upload.SleepMs(100);
        //upload.AbortUpload(); upload.NumBytesSent; upload.TotalUploadSize;
      end;
    except on E: Exception do
    end;

    if upload.UploadSuccess = 1 then
      fMain.ProgressEnd('ارسال اطلاعات انجام شد')
    else
    begin
      upload.AbortUpload;
      fMain.ProgressEnd('ارسال اطلاعات ناموفق بود');
    end;
  end;
}
end;

procedure TF_Web.btn1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to Count do
    sGrid.setCheckBoxState(0,i, true);
end;

{  webcopy1.items.clear;
  with WebCopy1.Items.Add do
  begin
    URL := 'http://alir.somee.com/FileUpload.aspx';
    Protocol := wpHttpUpload;
    TargetDir := fMain.sendFolderAddress; //'c:\temp';
    TargetFileName := sendFileName; //'myfile.txt';
  end;
  WebCopy1.ThreadExecute;
{
  with webcopy1.items.add do
  begin
    url := zipFileName;
    Protocol := wpHttpUpload;
    TargetDir := 'http://localhost:50267/MatchSupport/FileUpload.aspx';
  end;
  //webcopy1.threadexecute;
  webcopy1.Execute;
}

procedure TF_Web.SQL2XML( sql, filename : string; index : integer );
var
  sl : TStringList;
  i, j : Integer;
  field, content, temp : string;
begin
{
  AQXML.SQL.Text := sql;
  AQXML.Open;

  sl := TStringList.Create;
  sl.Add('<?xml version="1.0" encoding="utf-8"?>');
  sl.Add('<'+'_ID_' + MatchID +'>');

  for i := 1 to aqXML.RecordCount do
  begin
    sl.Add('<R>');
    for j := 0 to aqXML.FieldCount-1 do
    begin
      content := aqXML.Fields[j].AsString;
      if content <> '' then
      begin
        field := aqXML.Fields[j].FieldName;
        if field = 'PI' then
        begin
          if chPicture.Checked then
          begin
            if index = 1 then content := 'Library.bmp' else
            if index = 2 then content :=  aqXML.Fields[0].AsString + '.bmp' else
            if index = 3 then content :=  aqXML.Fields[0].AsString + '.jpg';
            TBlobField(aqXML.Fields[j]).SaveToFile(fMain.sendFolderAddress + content);
            upFiles.Add(fMain.sendFolderAddress + content);
          end;
        end else
        begin
          if field = 'W' then
          begin
            aqTemp.SQL.Text := 'SELECT Login.* FROM Login WHERE ((Login.[User Name])="'+ AesEnCrypt(aqXML.Fields[0].AsString, 'Code') +'");';
            aqTemp.Open;
            if aqTemp.RecordCount > 0 then
            begin
              temp := AesDeCrypt(aqTemp.FieldByName('Admin').AsString, aqXML.Fields[0].AsString);
              if (LeftStr(temp, 1) = 'A') or (LeftStr(temp, 1) = 'M') then
                sl.Add('<PE>A</PE>');
            end;

            content := AesDeCrypt(content, aqXML.Fields[0].AsString);
          end;
          sl.Add('<'+ field + '>' + content + '</'+ field + '>');
        end;
      end;
    end;

    if index = 1 then sl.Add('<ChildAge>' + fMain.options.Values['ChildAge'] + '</ChildAge>');
    sl.Add('</R>');
    aqXML.Next;
  end;
  sl.Add('</'+'_ID_' + MatchID +'>');

  sl.SaveToFile(filename, TEncoding.UTF8);
  sl.Free;
  fMain.EncodeFile(filename);
}
end;

function TF_Web.Index2XML( index : integer ) : string;
var
  fn, sqlTemp : string;
begin
  fn := fMain.sendFolderAddress + upObject[index].FileName + '.up';
  if chAll.Checked then
    sqlTemp := upObject[index].SQL + upObject[index].sqlWCheck + ';'
  else
    sqlTemp := upObject[index].SQL + upObject[index].sqlWCheck + upObject[index].sqlWDate + ';';
  SQL2XML(sqlTemp, fn, index);
  Result := fn;
end;

function GetNode( str : string; size : integer ) : string;
begin
  Result := Copy(str, 4, Length(str)-7);
end;

procedure TF_Web.FormCreate(Sender: TObject);
begin
  upFiles := TStringList.Create;
  sendFileName := 'upload.send';
end;

end.





