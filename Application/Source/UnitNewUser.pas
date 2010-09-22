unit UnitNewUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, ExtDlgs, Buttons, DBCtrls, StrUtils, ExtCtrls,
  AdvGroupBox, AdvPanel, AdvGlowButton, Grids, BaseGrid, AdvGrid, AdvCGrid,
  AdvAppStyler, AdvOfficeButtons, UnitMaster, ImgList;

type
  TfUser = class(TMaster)
    ADOQuery3: TADOQuery;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    bOk: TAdvGlowButton;
    bLogin: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gAccounts: TAdvColumnGrid;
    DBImage1: TDBImage;
    DataSource: TDataSource;
    pLogin: TAdvGroupBox;
    ePassword: TButtonedEdit;
    CheckBox4: TAdvOfficeCheckBox;
    Label18: TLabel;
    cbLogin: TComboBox;
    Label9: TLabel;
    gMenu: TAdvPanel;
    bClear: TAdvGlowButton;
    bAccounts: TAdvGlowButton;
    bEdit: TAdvGlowButton;
    bImportFromLibrary: TAdvGlowButton;
    gEdit: TAdvGroupBox;
    Label1: TLabel;
    meUserID: TMaskEdit;
    gDescription: TAdvGroupBox;
    Label10: TLabel;
    edtDescription: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    RG_S: TAdvOfficeRadioGroup;
    SpeedButton2: TAdvGlowButton;
    SpeedButton1: TAdvGlowButton;
    Edit7: TEdit;
    Label11: TLabel;
    eNationalID: TEdit;
    Label13: TLabel;
    MaskEdit3: TMaskEdit;
    Label8: TLabel;
    Label12: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Edit2: TEdit;
    ePhone: TEdit;
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ePasswordChange(Sender: TObject);
    procedure bAccountsClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bOkClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure meUserIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ePasswordLeftButtonClick(Sender: TObject);
    procedure loadUserFromMatch();
    procedure loadUserFromLibrary();
    procedure bImportFromLibraryClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure eNationalIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ePhoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure fillCBLogin(userID : string);
    procedure bLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    imgChange : boolean;
  end;

var
  fUser: TfUser;

implementation

uses UnitMain, uCryptography, UFaDate;

{$R *.dfm}

function SuggestCode() : string;
var code : integer;
begin
  Randomize;
  code := 0;
  while code < 1000 do code := Random(10000000) mod 10000;
  Result := IntToStr(code);
end;

procedure TfUser.bImportFromLibraryClick(Sender: TObject);
begin
  loadUserFromLibrary;
end;

procedure TfUser.bLoginClick(Sender: TObject);
begin
  ePasswordChange(nil);
end;

procedure TfUser.bAccountsClick(Sender: TObject);
var i : integer;
begin
  if not gAccounts.Visible then
  begin
    gAccounts.RowCount := 2;
    gAccounts.ClearRows(1,1);

    fMain.qTmp.SQL.Text := 'SELECT UserID, Permission, LastName FROM permissions INNER JOIN users ON permissions.UserID = users.ID WHERE Accept = 1';
    fMain.qTmp.Open;
    for i := 1 to fMain.qTmp.RecordCount do
    begin
      gAccounts.AddRow;

      gAccounts.Cells[0,i] := fMain.qTmp.FieldByName('UserID').AsString;
      gAccounts.Cells[1,i] := fMain.qTmp.FieldByName('LastName').AsString;
      gAccounts.Cells[2,i] := fMain.UserToPersian(fMain.StringToUser(fMain.qTmp.FieldByName('Permission').AsString));

      fMain.qTmp.Next;
    end;
    gAccounts.SortSettings.Direction := sdDescending;
    gAccounts.SortByColumn(2);

    gAccounts.RemoveRows(gAccounts.RowCount,1);
  end;
  gAccounts.Visible := not gAccounts.Visible;
end;

procedure TfUser.ePasswordLeftButtonClick(Sender: TObject);
begin
  ePassword.Text := SuggestCode;
end;

procedure TfUser.ePhoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then Edit7.SetFocus;
end;

procedure TfUser.bOkClick(Sender: TObject);
var gender, user, userID : String; i : Integer; j : TUser; inserted : boolean;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (eNationalID.Text = '') then
  begin
    fMain.MyShowMessage('لطفا نام، نام خانوادگی و شماره ملی را وارد کنید');
    Abort;
  end;
  if (MaskEdit3.Text = '    /  /  ') or (StrToInt(LeftStr(MaskEdit3.Text, 4)) > 1800) then
  begin
    fMain.MyShowMessage('لطفا تاریخ تولد را به سال شمسی وارد کنید');
    Abort;
  end;

  if meUserID.Text = '    ' then userID := '-1' else userID := meUserID.Text;

  if RG_S.ItemIndex = 0 then gender := fMain.GenderToString(gMale) else gender := fMain.GenderToString(gFemale);
  inserted := fMain.InsertOrUpdate('users', 'ID = '+ userID,
                                  ['NationalID', 'FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Gender', 'RegisterTime', 'Description', 'UserPass'],
                                  [eNationalID.Text, Edit1.Text, Edit2.Text, TFaDate.CreateByPersianDate(MaskEdit3.Text).ToGregorianDate, Edit7.Text, ePhone.Text, gender, Now, edtDescription.Text, encrypt(ePassword.Text)]);

  if inserted then userID := IntToStr(fMain.myCommand.InsertId);

//  Convert Image
//  if (Image1.Picture.Width <> 54) or (Image1.Picture.Height <> 72) then fMain.ScaleBmp(Image1.Picture.Bitmap);
  if imgChange then
    fMain.InsertOrUpdateJpeg(userID, 'user', Image1);

  if bLogin.Visible then
  begin
    for j := uUser to uAdmin do
      if fMain.UserToPersian(j) = cbLogin.Text then
      begin
        user := fMain.UserToString(j);
        break;
      end;

    if (user = fMain.UserToString(uUser)) or (ePassword.Text = '') then
      fMain.executeCommand('DELETE FROM permissions WHERE TournamentID = 1 AND UserID = '+ userID)
    else
      fMain.InsertOrUpdate('permissions', 'TournamentID = 1 AND UserID = '+ userID,
                          ['TournamentID', 'UserID', 'Permission', 'Accept'],
                          [1, userID, user, 1]);
  end;

  if inserted then fMain.MyShowMessage('عضو جدید با کد '+ userID +' ثبت شد');
{
  fMain.myQuery.SQL.Text := 'SELECT Permission FROM permissions WHERE Permission = "'+ fMain.UserToString(uAdmin) +'" OR Permission = "'+ fMain.UserToString(uMaster) +'"';
  fMain.myQuery.Open;
  if fMain.myQuery.RecordCount = 0  then
  begin
    fMain.executeCommand('UPDATE permissions SET Permission = "'+ fMain.UserToString(uMaster) +'" WHERE ID = 1111');
    fMain.MyShowMessage('چون هیچ مدیر کلی وجود ندارد، کد "1111" با کلمه‌ی عبور "1" مدیر کل می‌شود');
  end;
}
  if fMain.loginUser < uManager  then
    fMain.P_Temp.Visible := true;
  bClearClick(nil);
end;

procedure TfUser.bClearClick(Sender: TObject);
begin
  if fMain.loginUser < uManager then abort;

  bAccounts.Visible := (fMain.P_LS.ImageIndex > 0);
  gDescription.Visible := bAccounts.Visible;
  bLogin.Down := False;

  fillCBLogin('');
  meUserID.Text := '';
  imgChange := false;
  cbLogin.ItemIndex := 0;
  bLogin.Visible := True;
  pLogin.Visible := true;
  Edit1.Text := '';
  Edit2.Text := '';
  edtDescription.Text := '';
  eNationalID.Text := '';
  MaskEdit3.Text := '';
  Edit7.Text := '';
  ePhone.Text := '';
  RG_S.ItemIndex := 0;
  Image1.Picture := Nil;

  ePassword.Text := '';
  ePassword.PasswordChar := '*';
  CheckBox4.Checked := True;

  gEdit.Visible := false;
  {
  if fMain.ICMatch.Visible then
  begin
    fMain.qTmp.SQL.Text := 'SELECT ID FROM Users';
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount = 0 then Label5.Caption := fMain.options.Values['UserIdStart']
    else
    begin
      fMain.qTmp.SQL.Text := 'SELECT Max(ID) FROM Users';
      fMain.qTmp.Open;
      if fMain.qTmp.Fields[0].AsInteger >= StrToInt(fMain.options.Values['UserIdStart']) then
        Label5.Caption := IntToStr(fMain.qTmp.Fields[0].AsInteger + 1)
      else Label5.Caption := fMain.options.Values['UserIdStart'];
    end;
  end;
  }
  Edit1.SetFocus;
end;

procedure TfUser.bEditClick(Sender: TObject);
begin
  gEdit.Visible := true;
  meUserID.SetFocus;
  meUserID.SelectAll;
end;

procedure TfUser.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then ePassword.PasswordChar := '*'
  else ePassword.PasswordChar := #0;
end;

procedure TfUser.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then Edit2.SetFocus;
end;

procedure TfUser.Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then eNationalID.SetFocus;
end;

procedure TfUser.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then bOk.SetFocus;
end;

procedure TfUser.eNationalIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TfUser.ePasswordChange(Sender: TObject);
begin
  if ePassword.Text = '' then bLogin.Down := False else bLogin.Down := True;
end;

procedure TfUser.SpeedButton1Click(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      Image1.Picture.LoadFromFile(fMain.odJPEG.FileName);
      if (Image1.Picture.Width <> 54) or (Image1.Picture.Height <> 72) then
      begin
        Image1.Picture := nil;
        fMain.MyShowMessage('لطفا تصویر را به ابعاد نوشته شده تبدیل کنید');
      end;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfUser.SpeedButton2Click(Sender: TObject);
begin
  imgChange := true;
  Image1.Picture := nil;
end;

procedure TfUser.fillCBLogin(userID : string);
begin
  cbLogin.Items.Clear;
  cbLogin.Items.Add(fMain.UserToPersian(uUser));
  if fMain.loginUser >= uManager then
  begin
    cbLogin.Items.Add(fMain.UserToPersian(uOperator));
    cbLogin.Items.Add(fMain.UserToPersian(uDesigner));
    if fMain.loginUser >= uMaster then
      cbLogin.Items.Add(fMain.UserToPersian(uManager));
  end;

  if (userID <> '') and (fMain.loginUserID = userID) and (cbLogin.Items.IndexOf(fMain.UserToPersian(fMain.loginUser)) < 0) then
      cbLogin.Items.Add(fMain.UserToPersian(fMain.loginUser));
end;

procedure TfUser.loadUserFromMatch();
var dPermission, kind : String; rgID, pix : integer;
begin
  fMain.qTmp.SQL.Text := 'SELECT * FROM users LEFT JOIN permissions ON users.ID = permissions.UserID WHERE users.ID = '+ meUserID.Text;
  fMain.qTmp.Open;

  if fMain.qTmp.RecordCount = 1 then
  begin
    if not fMain.hasGenderPermission(fMain.qTmp.FieldByName('Gender').AsString) then
    begin
      fMain.MyShowMessage('شما اجازه دسترسی به اطلاعات این عضو را ندارید');
      bClear.Click;
      Abort;
    end;

    Edit1.Text := fMain.qTmp.FieldByName('FirstName').AsString;
    Edit2.Text := fMain.qTmp.FieldByName('LastName').AsString;
    MaskEdit3.Text := TFaDate.Create(fMain.qTmp.FieldByName('BirthDate').AsDateTime).ToDateString;
    ePhone.Text := fMain.qTmp.FieldByName('Phone').AsString;
    Edit7.Text := fMain.qTmp.FieldByName('Address').AsString;
    edtDescription.Text := fMain.qTmp.FieldByName('Description').AsString;
    eNationalID.Text := fMain.qTmp.FieldByName('NationalID').AsString;
    if fMain.qTmp.FieldByName('Gender').AsString = 'male' then RG_S.ItemIndex := 0 else RG_S.ItemIndex := 1;

    fillCBLogin(fMain.qTmp.FieldByName('ID').AsString);

    pix := cbLogin.Items.IndexOf(fMain.UserToPersian(fMain.StringToUser(fMain.qTmp.FieldByName('Permission').AsString)));
    if (pix >= 0) or ((fMain.loginUser >= uManager) and (fMain.qTmp.FieldByName('Permission').AsString = '')) then
    begin
      if fMain.qTmp.FieldByName('Permission').AsString <> '' then cbLogin.ItemIndex := pix else cbLogin.ItemIndex := 0;
      ePassword.Text := decrypt(fMain.qTmp.FieldByName('UserPass').AsString);
    end else
    begin
      bLogin.Visible := false;
      pLogin.Visible := false;
    end;

    fMain.loadJpeg(fMain.qTmp.FieldByName('ID').AsString, 'user', Image1, fMain.qTmp);
  end else
  begin
    fMain.MyShowMessage('عضوی با این کد ثبت نشده است');
    meUserID.SetFocus;
  end;
end;

procedure TfUser.loadUserFromLibrary();
begin
{x
  fMain.qTmpLibrary.SQL.Text := 'SELECT * FROM Users WHERE ID = "'+MaskEdit1.Text+'"';
  fMain.qTmpLibrary.Open;

  if fMain.qTmpLibrary.RecordCount <> 0 then
  begin
    if (fMain.isSuperUser) and (fMain.GenderToString(fMain.loginGender) <> fMain.qTmpLibrary.FieldByName('Gender').AsString) then
    begin
      fMain.MyShowMessage('شما اجازه دسترسی به اطلاعات این عضو را ندارید');
      bClear.Click;
      Abort;
    end;

    Label5.Caption := fMain.qTmpLibrary.FieldByName('ID').AsString;
    Edit1.Text := fMain.qTmpLibrary.FieldByName('Name').AsString;
    Edit2.Text := fMain.qTmpLibrary.FieldByName('Family').AsString;
    MaskEdit3.Text := fMain.qTmpLibrary.FieldByName('T_T').AsString;
    MaskEdit4.Text := fMain.qTmpLibrary.FieldByName('Phon').AsString;
    Edit7.Text := fMain.qTmpLibrary.FieldByName('Adress').AsString;

    if fMain.qTmpLibrary.FieldByName('Is Men').AsBoolean then RG_S.ItemIndex := 0 else RG_S.ItemIndex := 1;
  end else
  begin
    fMain.MyShowMessage('شما قبلا عضو نشده‌اید');
    MaskEdit1.SetFocus;
  end;
}
end;

procedure TfUser.meUserIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then loadUserFromMatch;
end;

procedure TfUser.MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then ePhone.SetFocus;
end;

procedure TfUser.FormCreate(Sender: TObject);
begin
  gAccounts.Align := alLeft;
end;

end.

{
procedure TfUser.MaskEnter();
var
  TempAdmin, PictureField : String;
begin
    BitBtn6.Click;
    if MaskEdit1.Text = '' then Abort;

    if RG_ML.ItemIndex = 1 then // from library
    begin
      PictureField := 'Ax';
      if DBImage1.DataField <> PictureField then
      begin
        ADOQuery3.Close;
        ADOQuery3.Connection := fMain.LibraryConnection;
        DBImage1.DataField := PictureField;
      end;
    end
    else
    begin
      PictureField := 'Picture';
      if DBImage1.DataField <> PictureField then
      begin
        ADOQuery3.Close;
        ADOQuery3.Connection := fMain.MatchConnection;
        DBImage1.DataField := 'Picture';
      end;
    end;

    ADOQuery3.SQL.Text := 'SELECT Users.* FROM Users WHERE (((Users.ID)="'+MaskEdit1.Text+'")); ';
    ADOQuery3.Open;

    if ADOQuery3.RecordCount <> 0 then
    begin

      if ( fMain.loginAdmin <> True ) and ( fMain.loginMan <> ADOQuery3.FieldByName('Is Men').AsBoolean ) then
      begin
        fMain.MyShowMessage('شما اجازه دسترسی به اطلاعات این عضو را ندارید');
        BitBtn6.Click;
        Abort;
      end;

      if ADOQuery3.FieldByName(PictureField).AsString <> '' then Image1.Picture := DBImage1.Picture;
      Label5.Caption := ADOQuery3.FieldByName('ID').AsString;
      Edit1.Text := ADOQuery3.FieldByName('Name').AsString;
      if RG_ML.ItemIndex = 0 then
        edtDescription.Text := ADOQuery3.FieldByName('Description').AsString;
      Edit2.Text := ADOQuery3.FieldByName('Family').AsString;
      MaskEdit3.Text := ADOQuery3.FieldByName('T_T').AsString;
      MaskEdit4.Text := ADOQuery3.FieldByName('Phon').AsString;
      Edit7.Text := ADOQuery3.FieldByName('Adress').AsString;

      if ADOQuery3.FieldByName('Is Men').AsBoolean then RG_S.ItemIndex := 0 else RG_S.ItemIndex := 1;

      if ( RG_ML.ItemIndex = 0 )and( ADOQuery3.FieldByName('WebPassword').AsString <> '' ) then
        Edit3.Text := AesDeCrypt( ADOQuery3.FieldByName('WebPassword').AsString, Label5.Caption )
      else Edit3.Text := '';

// Login
    AQ_Login.SQL.Text := 'SELECT Login.* FROM Login WHERE (((Login.[User Name])="'+ AesEnCrypt( MaskEdit1.Text, 'Code' ) +'"));';
    AQ_Login.Open;
    if AQ_Login.RecordCount > 0 then
    begin
      ePassword.Text := AesDeCrypt( AQ_Login.FieldByName('Pass').AsString, MaskEdit1.Text );

      TempAdmin := AesDeCrypt( AQ_Login.FieldByName('Admin').AsString, MaskEdit1.Text );

      if RightStr( TempAdmin, 4 ) = MaskEdit1.Text then
      begin
        if LeftStr( TempAdmin, 1 ) = 'A' then RadioGroup1.ItemIndex := 0;
        if LeftStr( TempAdmin, 1 ) = 'M' then RadioGroup1.ItemIndex := 1;
        if LeftStr( TempAdmin, 1 ) = 'O' then RadioGroup1.ItemIndex := 2;
      end;
    end;

    end else
    begin
      fMain.MyShowMessage('شما قبلا عضو نشده‌اید');
      MaskEdit1.SetFocus;
    end;
end;
}

