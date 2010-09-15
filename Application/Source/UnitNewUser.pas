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
    AdvPanel6: TAdvPanel;
    AdvGroupBox2: TAdvGroupBox;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    P_Select: TAdvGroupBox;
    Label15: TLabel;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    bOk: TAdvGlowButton;
    bLogin: TAdvGlowButton;
    bClear: TAdvGlowButton;
    bAccounts: TAdvGlowButton;
    AdvGroupBox1: TAdvGroupBox;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    RG_ML: TAdvOfficeRadioGroup;
    gDescription: TAdvGroupBox;
    AdvGroupBox7: TAdvGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    MaskEdit3: TMaskEdit;
    Label8: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    MaskEdit4: TMaskEdit;
    SpeedButton1: TAdvGlowButton;
    SpeedButton2: TAdvGlowButton;
    AdvGroupBox4: TAdvGroupBox;
    Image1: TImage;
    RG_S: TAdvOfficeRadioGroup;
    Label10: TLabel;
    edtDescription: TEdit;
    gAccounts: TAdvColumnGrid;
    Label4: TLabel;
    Label7: TLabel;
    DBImage1: TDBImage;
    DataSource: TDataSource;
    pLogin: TAdvGroupBox;
    AdvGroupBox3: TAdvGroupBox;
    Label18: TLabel;
    CheckBox4: TAdvOfficeCheckBox;
    ePassword: TButtonedEdit;
    rgLogin: TAdvOfficeRadioGroup;
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RG_MLClick(Sender: TObject);
    procedure ePasswordChange(Sender: TObject);
    procedure bAccountsClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bOkClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ePasswordLeftButtonClick(Sender: TObject);
    procedure loadUserFromMatch();
    procedure loadUserFromLibrary();
    procedure rgLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    imgChange : boolean;
  end;

var
  fUser: TfUser;

implementation

uses UnitMain, uCryptography;

{$R *.dfm}

function SuggestCode() : string;
var code : integer;
begin
  Randomize;
  code := 0;
  while code < 1000 do code := Random(10000000) mod 10000;
  Result := IntToStr(code);
end;

procedure TfUser.RG_MLClick(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TfUser.bLoginClick(Sender: TObject);
begin
  ePasswordChange(nil);
  pLogin.Visible := not pLogin.Visible;
end;

procedure TfUser.bAccountsClick(Sender: TObject);
var i : integer; kind : String;
begin
  if not gAccounts.Visible then
  begin
    gAccounts.RowCount := 2;
    gAccounts.ClearRows(1,1);

    fMain.qTmp.SQL.Text := 'SELECT ID, LastName, Permission FROM Users WHERE Permission <> ""';
    fMain.qTmp.Open;
    for i := 1 to fMain.qTmp.RecordCount do
    begin
      gAccounts.AddRow;
      kind := Copy(decrypt(fMain.qTmp.FieldByName('Permission').AsString), 5, 1);

      gAccounts.Cells[0,i] := fMain.qTmp.FieldByName('ID').AsString;
      gAccounts.Cells[1,i] := fMain.qTmp.FieldByName('LastName').AsString;
      if kind = 'S' then gAccounts.Cells[2,i] := 'سایت' else
      if kind = 'O' then gAccounts.Cells[2,i] := 'اپراتور' else
      if kind = 'M' then gAccounts.Cells[2,i] := 'مدیر' else
      if kind = 'A' then gAccounts.Cells[2,i] := 'مدیر كل';

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

procedure TfUser.bOkClick(Sender: TObject);
var permission : String; B : Boolean; i : Integer;
begin
  if (Edit1.Text = '') or (Edit2.Text = '')  then
  begin
    fMain.MyShowMessage('لطفا نام و نام خانوادگی را وارد كنید');
    Abort;
  end;
  if (MaskEdit3.Text = '    /  /  ') or (StrToInt(LeftStr(MaskEdit3.Text, 4)) > 1800) then
  begin
    fMain.MyShowMessage('لطفا تاریخ تولد را به سال شمسی وارد کنید');
    Abort;
  end;

  permission := '';
  if ePassword.Text <> '' then
  begin
    case rgLogin.ItemIndex of
      0 : permission := 'A';
      1 : permission := 'M';
      2 : permission := 'O';
      3 : permission := 'S';
    end;
    permission := encrypt(Label5.Caption + permission +  ePassword.Text);
  end;

  if RG_S.ItemIndex = 0 then B := true else B := false;
  fMain.executeCommand('DELETE FROM Users WHERE ID = '+ Label5.Caption);
  fMain.executeCommand('INSERT INTO Users (ID, FirstName, LastName, BirthDate, Address, Phone, Man, RegisterDate, Description, Permission) '+
                                  'VALUES ('+ Label5.Caption +', "'+ Edit1.Text +'", "'+ Edit2.Text +'", "'+ MaskEdit3.Text +'", "'+ Edit7.Text +'", "'+ MaskEdit4.Text +'", '+ BoolToStr(B) +', "'+ fMain.getShamsiDate +'", "'+ edtDescription.Text +'", "'+ permission +'")');

//  Convert Image
//  if (Image1.Picture.Width <> 54) or (Image1.Picture.Height <> 72) then fMain.ScaleBmp(Image1.Picture.Bitmap);
  if imgChange then
  begin
    fMain.executeCommand('DELETE FROM Pictures WHERE ID = '+ Label5.Caption);
    fMain.insertJpeg(Label5.Caption, Image1);
  end;

{
  fMain.qTmp.SQL.Text := 'SELECT Permission FROM Users WHERE ID = '+ Label5.Caption;
  fMain.qTmp.Open;

  admins := 0;
  for i := 1 to fMain.qTmp.RecordCount do
  begin
    if Copy(decrypt(fMain.qTmp.FieldByName('Permission').AsString), 5, 1) = 'A' then
    begin
      admins := admins + 1;
      break;
    end;
    fMain.qTmp.Next;
  end;

  if admins = 0 then
  begin
    fMain.executeCommand('UPDATE Users SET Permission = "'+ encrypt('5111A1') +'" WHERE ID = 5111');
    fMain.MyShowMessage('چون هیچ مدیر کلی وجود ندارد، کد "5111" با کلمه‌ی عبور "1" مدیر کل می‌شود');
  end;
}
  bClear.Click;
end;

procedure TfUser.bClearClick(Sender: TObject);
begin
  bAccounts.Visible := (fMain.P_LS.ImageIndex > 0);
  gDescription.Visible := bAccounts.Visible;
  bLogin.Down := False;
  pLogin.Visible := False;

  Edit1.Text := '';
  Edit2.Text := '';
  edtDescription.Text := '';
  MaskEdit3.Text := '';
  Edit7.Text := '';
  MaskEdit4.Text := '';
  RG_S.ItemIndex := 0;
  Image1.Picture := Nil;

  rgLogin.ItemIndex := 3;
  ePassword.Text := '';
  ePassword.PasswordChar := '*';
  CheckBox4.Checked := True;

  if fMain.ICMatch.Visible then
  begin
    fMain.qTmp.SQL.Text := 'SELECT ID FROM Users';
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount = 0 then Label5.Caption := '5111'
    else
    begin
      fMain.qTmp.SQL.Text := 'SELECT Max(ID) FROM Users';
      fMain.qTmp.Open;
      if fMain.qTmp.Fields[0].AsInteger > 5000 then
        Label5.Caption := IntToStr(fMain.qTmp.Fields[0].AsInteger + 1)
      else Label5.Caption := '5111';
    end;
  end;

  Edit1.SetFocus;
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

procedure TfUser.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then MaskEdit3.SetFocus;
end;

procedure TfUser.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then bOk.SetFocus;
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

function checkPermission(rID : integer) : boolean;
var pID : integer; uID, lID : string;
begin
  pID := fMain.P_LS.ImageIndex;
  //rID := fUser.rgLogin.ItemIndex;
  uID := fUser.Label5.Caption;
  lID := fMain.loginUserID;
  Result := (pID <= (2 - rID)) and (pID <> 2) and ((lID <> uID) or (pID <= (1 - rID)));
end;

procedure TfUser.loadUserFromMatch();
var dPermission, kind : String; rgID : integer;
begin
  fMain.qTmp.SQL.Text := 'SELECT * FROM Users WHERE ID = '+ MaskEdit1.Text;
  fMain.qTmp.Open;

  if fMain.qTmp.RecordCount = 1 then
  begin
    if (fMain.loginAdmin <> True) and (fMain.loginMan <> fMain.qTmp.FieldByName('Man').AsBoolean) then
    begin
      fMain.MyShowMessage('شما اجازه دسترسی به اطلاعات این عضو را ندارید');
      bClear.Click;
      Abort;
    end;

    Label5.Caption := fMain.qTmp.FieldByName('ID').AsString;
    Edit1.Text := fMain.qTmp.FieldByName('FirstName').AsString;
    Edit2.Text := fMain.qTmp.FieldByName('LastName').AsString;
    MaskEdit3.Text := fMain.qTmp.FieldByName('BirthDate').AsString;
    MaskEdit4.Text := fMain.qTmp.FieldByName('Phone').AsString;
    Edit7.Text := fMain.qTmp.FieldByName('Address').AsString;
    edtDescription.Text := fMain.qTmp.FieldByName('Description').AsString;
    if fMain.qTmp.FieldByName('Man').AsBoolean then RG_S.ItemIndex := 0 else RG_S.ItemIndex := 1;

    if fMain.qTmp.FieldByName('Permission').AsString <> '' then
    begin
      dPermission := decrypt(fMain.qTmp.FieldByName('Permission').AsString);
      kind := Copy(dPermission, 5, 1);

      ePassword.Text := MidStr(dPermission, 6,  Length(dPermission) - 5);
      if LeftStr(dPermission, 4) = Label5.Caption then
      begin
        if kind = 'A' then rgID := 0 else
        if kind = 'M' then rgID := 1 else
        if kind = 'O' then rgID := 2 else
        if kind = 'S' then rgID := 3;
      end;

      if checkPermission(rgID) then
      begin
        bClear.Click;
        fMain.MyShowMessage('شما اجازه دستیابی به اطلاعات این عضو را ندارید');
        Abort;
      end else rgLogin.ItemIndex := rgID;
    end;

    fMain.loadJpeg(Label5.Caption, Image1, fMain.qTmp);
  end else
  begin
    fMain.MyShowMessage('شما قبلا عضو نشده‌اید');
    MaskEdit1.SetFocus;
  end;
end;

procedure TfUser.loadUserFromLibrary();
begin
  fMain.qTmpLibrary.SQL.Text := 'SELECT * FROM Users WHERE ID = "'+MaskEdit1.Text+'"';
  fMain.qTmpLibrary.Open;

  if fMain.qTmpLibrary.RecordCount <> 0 then
  begin
    if (fMain.loginAdmin <> True) and (fMain.loginMan <> fMain.qTmpLibrary.FieldByName('Man').AsBoolean) then
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
end;

procedure TfUser.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    if RG_ML.ItemIndex = 0 then
      loadUserFromMatch
    else
      loadUserFromLibrary;
  end;
end;

procedure TfUser.MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then MaskEdit4.SetFocus;
end;

procedure TfUser.MaskEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then Edit7.SetFocus;
end;

procedure TfUser.rgLoginClick(Sender: TObject);
begin
  if checkPermission(rgLogin.ItemIndex) then
  begin
    fMain.MyShowMessage('شما نمی‌توانید این مجوز را بدهید');
    if fMain.loginUserID = Label5.Caption then
      rgLogin.ItemIndex := 2 - fMain.P_LS.ImageIndex
    else
      rgLogin.ItemIndex := 3 - fMain.P_LS.ImageIndex;
  end;
end;

procedure TfUser.FormCreate(Sender: TObject);
begin
  gAccounts.Align := alLeft;
end;

procedure TfUser.FormShow(Sender: TObject);
begin
  bClear.Click;
  MaskEdit1.SetFocus;
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

