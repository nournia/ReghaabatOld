unit UnitUser;

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
    bApply: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    gAccounts: TAdvColumnGrid;
    DBImage1: TDBImage;
    DataSource: TDataSource;
    pLogin: TAdvGroupBox;
    ePassword: TButtonedEdit;
    chPassword: TAdvOfficeCheckBox;
    Label18: TLabel;
    cbLogin: TComboBox;
    Label9: TLabel;
    gMenu: TAdvPanel;
    bNewUser: TAdvGlowButton;
    bAccounts: TAdvGlowButton;
    bEdit: TAdvGlowButton;
    bImportFromLibrary: TAdvGlowButton;
    gEdit: TAdvGroupBox;
    gDescription: TAdvGroupBox;
    Label10: TLabel;
    eDescription: TEdit;
    Label2: TLabel;
    eFirstName: TEdit;
    rgGender: TAdvOfficeRadioGroup;
    SpeedButton2: TAdvGlowButton;
    SpeedButton1: TAdvGlowButton;
    eAddress: TEdit;
    Label11: TLabel;
    eNationalID: TEdit;
    Label13: TLabel;
    meBirthDate: TMaskEdit;
    Label8: TLabel;
    Label12: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    iUser: TImage;
    Label3: TLabel;
    eLastName: TEdit;
    ePhone: TEdit;
    meUserID: TMaskEdit;
    Label1: TLabel;
    Label5: TLabel;

    procedure refresh();
    function validate() : boolean;
    procedure loadData(id : integer);
    procedure bAccountsClick(Sender: TObject);
    procedure chPasswordClick(Sender: TObject);
    procedure meBirthDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bApplyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure meUserIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ePasswordLeftButtonClick(Sender: TObject);
    procedure loadUserFromLibrary();
    procedure bImportFromLibraryClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);

    procedure fillCBLogin(userID : string);
    procedure bNewUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    userId : integer;
    imgChange : boolean;
  end;

var
  fUser: TfUser;

implementation

uses UnitMain, uCryptography, UFaDate, UnitTypes;

{$R *.dfm}

procedure TfUser.refresh();
begin
  userId := -1;

  bAccounts.Visible := (fMain.P_LS.ImageIndex > 0);
  gDescription.Visible := bAccounts.Visible;
  pLogin.ImageIndex := -1;

  fillCBLogin('');
  meUserID.Text := '';
  imgChange := false;
  cbLogin.ItemIndex := 0;
  pLogin.Visible := true;
  eFirstName.Text := '';
  eLastName.Text := '';
  eDescription.Text := '';
  eNationalID.Text := '';
  meBirthDate.Text := '';
  eAddress.Text := '';
  ePhone.Text := '';
  rgGender.ItemIndex := 0;
  iUser.Picture := Nil;
  gEdit.Visible := false;

  ePassword.Text := '';
  ePassword.PasswordChar := '*';
  chPassword.Checked := true;

  eFirstName.SetFocus;
end;
function TfUser.validate() : boolean;
var tmp : TDateTime;
begin
  Result := (eFirstName.Text <> '') and (eLastName.Text <> '') and (eNationalID.Text <> '') and (meBirthDate.Text <> '    /  /  ');
  if not Result then
  begin
    fMain.MyShowMessage('مقادیر نام، نام‌خانوادگی، شماره‌ی ملی و تاریخ تولد باید پر شوند');
    exit;
  end;

  try
    tmp := TFaDate.Create(meBirthDate.Text).ToGregorianDate
  except on E: Exception do
    Result := false;
  end;
  if not Result then
  begin
    fMain.MyShowMessage('مقدار تاریخ تولد معتبر نیست');
    exit;
  end;

  fMain.myQuery.SQL.Text := 'SELECT ID FROM users WHERE NationalID = '+ eNationalID.Text;
  fMain.myQuery.Open;
  if (fMain.myQuery.RecordCount > 0) and (fMain.myQuery.Fields[0].AsInteger <> userId) then Result := false;
  if not Result then
  begin
    fMain.MyShowMessage('این شماره ملی برای کاربر دیگری ثبت شده است');
    exit;
  end;
end;
procedure TfUser.loadData(id : integer);
var dPermission, kind : String; pix : integer;
begin
  refresh;
  userId := id;

  with fMain.myQuery do
  begin
    SQL.Text := 'SELECT * FROM users LEFT JOIN permissions ON users.ID = permissions.UserID WHERE users.ID = '+ IntToStr(id);
    Open;

    if RecordCount = 0 then fMain.MyShowMessage('عضوی با این کد ثبت نشده است') else
    begin
      if not fMain.hasGenderPermission(FieldByName('Gender').AsString) then fMain.MyShowMessage('شما اجازه دسترسی به اطلاعات این عضو را ندارید') else
      begin
        eFirstName.Text := FieldByName('FirstName').AsString;
        eLastName.Text := FieldByName('LastName').AsString;
        meBirthDate.Text := TFaDate.Create(FieldByName('BirthDate').AsDateTime).ToDateString;
        ePhone.Text := FieldByName('Phone').AsString;
        eAddress.Text := FieldByName('Address').AsString;
        eDescription.Text := FieldByName('Description').AsString;
        eNationalID.Text := FieldByName('NationalID').AsString;
        rgGender.ItemIndex := Ord(StringToGender(FieldByName('Gender').AsString));

        fillCBLogin(FieldByName('ID').AsString);

        pix := cbLogin.Items.IndexOf(UserToPersian(StringToUser(FieldByName('Permission').AsString)));
        if (pix >= 0) or ((fMain.loginUser >= uManager) and (FieldByName('Permission').AsString = '')) then
        begin
          if FieldByName('Permission').AsString <> '' then cbLogin.ItemIndex := pix else cbLogin.ItemIndex := 0;
          pLogin.ImageIndex := 0;
        end else
          pLogin.Visible := false;

        fMain.loadJpeg(FieldByName('ID').AsString, 'user', iUser, fMain.myQuery);
      end;
    end;
  end;
end;

procedure TfUser.bImportFromLibraryClick(Sender: TObject);
begin
  loadUserFromLibrary;
end;

procedure TfUser.bNewUserClick(Sender: TObject);
begin
  refresh;
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
      gAccounts.Cells[2,i] := UserToPersian(StringToUser(fMain.qTmp.FieldByName('Permission').AsString));

      fMain.qTmp.Next;
    end;
    gAccounts.SortSettings.Direction := sdDescending;
    gAccounts.SortByColumn(2);

    gAccounts.RemoveRows(gAccounts.RowCount,1);
  end;
  gAccounts.Visible := not gAccounts.Visible;
end;

procedure TfUser.ePasswordLeftButtonClick(Sender: TObject);
  function SuggestCode() : string;
  var code : integer;
  begin
    Randomize;
    code := 0;
    while code < 1000 do code := Random(10000000) mod 10000;
    Result := IntToStr(code);
  end;
begin
  ePassword.Text := SuggestCode;
  chPassword.Checked := false;
end;

procedure TfUser.bApplyClick(Sender: TObject);
var gender, user : string; tmp : Integer; j : TUser; newuser : boolean;
begin
  if validate then
  begin
    newuser := userId = -1;
    if rgGender.ItemIndex = 0 then gender := GenderToString(gMale) else gender := GenderToString(gFemale);
    userId := fMain.qInsertOrUpdate('users', ['ID', 'NationalID', 'FirstName', 'LastName', 'BirthDate', 'Address', 'Phone', 'Gender', 'RegisterTime', 'Description'],
                                             [userId, eNationalID.Text, eFirstName.Text, eLastName.Text, TFaDate.CreateByPersianDate(meBirthDate.Text).ToGregorianDate, eAddress.Text, ePhone.Text, gender, Now, eDescription.Text]);

  //  Convert Image
  //  if (Image1.Picture.Width <> 54) or (Image1.Picture.Height <> 72) then fMain.ScaleBmp(Image1.Picture.Bitmap);
    if imgChange then
      fMain.qInsertOrUpdateJpeg(IntToStr(userID), 'user', iUser);

    if pLogin.Visible then
    begin
      if ePassword.Text <> '' then
        fMain.executeCommand('UPDATE users SET UserPass = sha1("'+ ePassword.Text +'") WHERE ID = '+ IntToStr(userID));

      for j := uUser to uAdmin do
        if UserToPersian(j) = cbLogin.Text then
        begin
          user := UserToString(j);
          break;
        end;

      fMain.qInsertOrUpdate('permissions', ['ID', 'TournamentID', 'UserID', 'Permission', 'Accept'], [-1, 1, userID, user, 1], 'TournamentID = 1 AND UserID = '+ IntToStr(userID));
    end;

    if newuser then
    begin
      fMain.qInsertOrUpdate('scores', ['ID', 'TournamentID', 'UserID', 'ParticipateTime'], [-1, 1, userID, Now]);
      fMain.MyShowMessage('عضو جدید با کد '+ IntToStr(userID) +' ثبت شد');
    end;
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
    refresh;
  end;
end;

procedure TfUser.bEditClick(Sender: TObject);
begin
  gEdit.Visible := true;
  meUserID.SetFocus;
  meUserID.SelectAll;
end;

procedure TfUser.chPasswordClick(Sender: TObject);
begin
  if chPassword.Checked then ePassword.PasswordChar := '*' else ePassword.PasswordChar := #0;
end;

procedure TfUser.SpeedButton1Click(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      iUser.Picture.LoadFromFile(fMain.odJPEG.FileName);
      if (iUser.Picture.Width <> 54) or (iUser.Picture.Height <> 72) then
      begin
        iUser.Picture := nil;
        fMain.MyShowMessage('لطفا تصویر را به ابعاد نوشته شده تبدیل کنید');
      end;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfUser.SpeedButton2Click(Sender: TObject);
begin
  imgChange := true;
  iUser.Picture := nil;
end;

procedure TfUser.fillCBLogin(userID : string);
begin
  cbLogin.Items.Clear;
  cbLogin.Items.Add(UserToPersian(uUser));
  if fMain.loginUser >= uManager then
  begin
    cbLogin.Items.Add(UserToPersian(uDesigner));
    cbLogin.Items.Add(UserToPersian(uOperator));
    if fMain.loginUser >= uMaster then
      cbLogin.Items.Add(UserToPersian(uManager));
  end;

  if (userID <> '') and (fMain.loginUserID = userID) and (cbLogin.Items.IndexOf(UserToPersian(fMain.loginUser)) < 0) then
      cbLogin.Items.Add(UserToPersian(fMain.loginUser));
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
var tmp : string;
begin
  if key = 13 then
  begin
    tmp := meUserID.Text;
    loadData(StrToInt(meUserID.Text));
    gEdit.Visible := true;
    meUserID.Text := tmp;
    if eFirstName.Text = '' then
      meUserID.SetFocus;
  end;
end;

procedure TfUser.meBirthDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

