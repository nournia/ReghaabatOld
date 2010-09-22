unit UnitDesignWP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, ExtDlgs, Buttons, ExtCtrls, StdCtrls, Mask, Spin, DBCtrls,
  AdvSpin, AdvToolBtn, AdvGlowButton, AdvPanel, AdvGroupBox, AdvAppStyler, UnitMaster,
  jpeg, clisted;

type
  TfDesignWP = class(TMaster)
    P_Action: TAdvPanel;
    BitBtn3: TAdvGlowButton;
    BitBtn1: TAdvGlowButton;
    BitBtn4: TAdvGlowButton;
    P_MatchEdit: TAdvPanel;
    AdvGroupBox3: TAdvGroupBox;
    ComboBox2: TComboBox;
    Edit5: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    AdvGroupBox1: TAdvGroupBox;
    AdvGroupBox2: TAdvGroupBox;
    Label4: TLabel;
    SE_Height: TAdvSpinEdit;
    SE_Width: TAdvSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    SE_Top: TAdvSpinEdit;
    SE_Left: TAdvSpinEdit;
    Label13: TLabel;
    MaskEdit2: TMaskEdit;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvGroupBox5: TAdvGroupBox;
    Label2: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    Image1: TImage;
    gContent: TAdvGroupBox;
    AdvGroupBox6: TAdvGroupBox;
    bLoad: TAdvGlowButton;
    bFit: TAdvGlowButton;
    bClear: TAdvGlowButton;
    bSave: TAdvGlowButton;
    Memo1: TMemo;
    SpinEdit1: TAdvSpinEdit;
    SpinEdit4: TAdvSpinEdit;
    Label14: TLabel;
    clTags: TCheckListEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SE_LeftChange(Sender: TObject);
    procedure SE_TopChange(Sender: TObject);
    procedure SE_WidthChange(Sender: TObject);
    procedure SE_HeightChange(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bClearClick(Sender: TObject);
    procedure bLoadClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bFitClick(Sender: TObject);
    procedure AddWPMatch(Code : string);
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure clTagsClickBtn(Sender: TObject);
  private
    { Private declarations }
  public
    genuineID : String;
    workMode, imgChange, SH, Own : Boolean;
    ImgX, ImgY : Integer;
  end;

var
  fDesignWP: TfDesignWP;

implementation

uses UnitMain, UnitTDE;

{$R *.dfm}

procedure TfDesignWP.BitBtn1Click(Sender: TObject);
var
  LLCode : String;
begin
  fMain.deleteMatch('320000');
  AddWPMatch('320000');
  F_TDE.GetFastReport('0', '320000', 'Preview', False, True);
  fMain.deleteMatch('320000');
end;

procedure TfDesignWP.BitBtn3Click(Sender: TObject);
begin
  if Edit5.Text = '' then fMain.MyShowMessage('لطفا برای مسابقه یك عنوان مناسب انتخاب كنید')
  else
  begin
    fMain.deleteMatch(fMain.StrToMatchID(Label2.Caption), false);
    AddWPMatch(fMain.StrToMatchID(Label2.Caption));
    BitBtn4.Click;
  end;
end;

procedure TfDesignWP.AddWPMatch(Code : string);
var
  S, designer : String;
begin
  if workMode then S := '2' else S := '3';
  if MaskEdit2.Text = '    ' then designer := 'NULL' else designer := MaskEdit2.Text;

  fMain.executeCommand('INSERT INTO Matches (ID, DesignerID, Title, MaxScore, Age, State, Tags, Content, PictureConfiguration, GenuineID) '+
  'VALUES ('+ Code +', '+ designer +', "'+ fMain.correctString(Edit5.Text) +'", '+ SpinEdit1.Text +', '+ SpinEdit4.Text +', '+ IntToStr(ComboBox2.ItemIndex) +', "'+ clTags.Text +'", "'+ fMain.correctString(Memo1.Lines.Text) +'", "'+ SE_Height.Text + ' ' + SE_Width.Text + ' ' + SE_Top.Text + ' ' + SE_Left.Text +'", '+ genuineID +')');

  if imgChange then fMain.InsertOrUpdateJpeg(Code, 'match', Image1);
end;

procedure TfDesignWP.BitBtn4Click(Sender: TObject);
begin
  clTags.Text := '';
  ComboBox2.ItemIndex := 0;
  SpinEdit1.Value := 0;
  Edit5.Text:='';
  MaskEdit2.Text := '';
  SpinEdit4.Value := 12;
  bFit.Down := False;
  Own := true;
  if bFit.Down then bFit.ImageIndex := 24 else bFit.ImageIndex := 28;

  Memo1.Clear;
  bClear.Click;
  if workMode then Label2.Caption := fMain.getNewMatchID(2) else Label2.Caption := fMain.getNewMatchID(3);
end;

procedure TfDesignWP.SE_HeightChange(Sender: TObject);
begin
  Image1.Height := Round( SE_Height.FloatValue );
  if bFit.Down then
    SE_Width.FloatValue := Round( ( Image1.Picture.Width / Image1.Picture.Height ) * SE_Height.FloatValue * 100 ) / 100;
end;

procedure TfDesignWP.SE_WidthChange(Sender: TObject);
begin
  Image1.Width := Round( SE_Width.FloatValue );
  if bFit.Down then
    SE_Height.FloatValue := Round( ( Image1.Picture.Height / Image1.Picture.Width ) * SE_Width.FloatValue * 100 ) / 100;
end;

procedure TfDesignWP.SE_TopChange(Sender: TObject);
begin
  Image1.Top := Round( SE_Top.FloatValue );
end;

procedure TfDesignWP.SE_LeftChange(Sender: TObject);
begin
  Image1.Left := Round( SE_Left.FloatValue );
end;

procedure TfDesignWP.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Edit5.SetFocus;
end;

procedure TfDesignWP.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then  Memo1.SetFocus;
end;

procedure TfDesignWP.FormCreate(Sender: TObject);
begin
  ComboBox2.Items.Clear;
  ComboBox2.Items.Add(fMain.cStates[0]);
  ComboBox2.Items.Add(fMain.cStates[1]);
  ComboBox2.Items.Add(fMain.cStates[2]);
  ComboBox2.ItemIndex := 0;
  clTags.DropWidth := clTags.Width;

  Image1.Top := 0;
  Image1.Left := 0;
end;

procedure TfDesignWP.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SH := True;
  ImgX := X;
  ImgY := Y;
end;

procedure TfDesignWP.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if SH = True then
  begin
    TImage( Sender ).Left := X + TImage( Sender ).Left - ImgX;
    TImage( Sender ).Top := Y + TImage( Sender ).Top - ImgY;
    SE_Top.FloatValue := Image1.Top;
    SE_Left.FloatValue := Image1.Left;
  end;
end;

procedure TfDesignWP.Image1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SH := False;
end;

procedure TfDesignWP.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then  SpinEdit4.SetFocus;
end;

procedure TfDesignWP.bLoadClick(Sender: TObject);
begin
  if fMain.odJPEG.Execute then
  begin
    imgChange := true;
    if UpperCase(ExtractFileExt(fMain.odJPEG.FileName)) = '.JPG' then
    begin
      Image1.Picture.LoadFromFile(fMain.odJPEG.FileName);
      SE_Height.FloatValue := Round(Image1.Picture.Height / 7.256 * 100) / 100;
      SE_Width.FloatValue := Round(Image1.Picture.Width / 7.256 * 100) / 100;
      SE_Top.FloatValue := 0;
      SE_Left.FloatValue := 0;
    end else fMain.MyShowMessage('قالب تصویر نامناسب است');
  end;
end;

procedure TfDesignWP.bSaveClick(Sender: TObject);
begin
  if fMain.sdJPEG.Execute then
     Image1.Picture.SaveToFile(fMain.AddExtension(fMain.sdJPEG.FileName, '.jpg'));
end;

procedure TfDesignWP.clTagsClickBtn(Sender: TObject);
begin
  clTags.DropWidth := clTags.Width;
end;

procedure TfDesignWP.bClearClick(Sender: TObject);
begin
  imgChange := true;
  SE_Height.FloatValue := 0;
  SE_Width.FloatValue := 0;
  SE_Top.FloatValue := 0;
  SE_Left.FloatValue := 0;
  Image1.Picture := nil;
end;

procedure TfDesignWP.bFitClick(Sender: TObject);
begin
  if bFit.Down then bFit.ImageIndex := 24 else bFit.ImageIndex := 28;
end;

procedure TfDesignWP.SpinEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then  MaskEdit2.SetFocus;
end;

procedure TfDesignWP.SpinEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then  ComboBox2.SetFocus;
end;

end.
