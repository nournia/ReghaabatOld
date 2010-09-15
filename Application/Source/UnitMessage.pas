unit UnitMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvOfficeTabSet, StdCtrls, Mask, AdvPanel, AdvAppStyler,
  AdvGlowButton, AdvGroupBox, ExtCtrls, Grids, BaseGrid, AdvGrid, DBAdvGrid, DB,
  ADODB, UnitMaster, MemDS, DBAccess, MyAccess;

type
  TfMessage = class(TMaster)
    P_Inbox: TAdvPanel;
    dsMessage: TDataSource;
    P_Send: TAdvPanel;
    AdvGroupBox2: TAdvGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    lSource: TLabel;
    bbSend: TAdvGlowButton;
    meDestination: TMaskEdit;
    mContent: TMemo;
    AdvOfficeTabSet1: TAdvOfficeTabSet;
    gMessage: TDBAdvGrid;
    lName: TLabel;
    AdvGroupBox1: TAdvGroupBox;
    Label3: TLabel;
    lSourceRead: TLabel;
    Label1: TLabel;
    lSendDate: TLabel;
    mContentRead: TMemo;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    qMessage: TMyQuery;
    procedure AdvOfficeTabSet1Change(Sender: TObject);
    procedure bbSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure meDestinationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gMessageGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure gMessageSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMessage: TfMessage;

implementation

uses UnitMain;

{$R *.dfm}
procedure TfMessage.AdvOfficeTabSet1Change(Sender: TObject);
var
  va : Boolean;
  cond : string;
begin
  if AdvOfficeTabSet1.ActiveTabIndex = 0 then // new message
  begin
    P_Inbox.Visible := False;
    P_Send.Align := alClient;
    P_Send.Visible := True;
    meDestination.SetFocus;
  end else
  begin

  if AdvOfficeTabSet1.ActiveTabIndex = 1 then // read messages
    cond := 'WHERE DestinationID = '+ fMain.loginUserID
  else if AdvOfficeTabSet1.ActiveTabIndex = 2 then // sent messages
    cond := 'WHERE SourceID = '+ fMain.loginUserID;

  qMessage.SQL.Text := 'SELECT ID, SourceID, DestinationID, Left(Content, 255) AS Content, SendDate, Viewed FROM Messages '+ cond +' ORDER BY SendDate DESC, SourceID';
  qMessage.Open;

  P_Send.Visible := False;
  P_Inbox.Align := alClient;
  P_Inbox.Visible := True;

  with fMain do
  begin
    qTmp.SQL.Text := 'SELECT ID FROM Messages WHERE Viewed = False AND DestinationID = '+ loginUserID;
    qTmp.Open;
    if qTmp.RecordCount > 0 then nMessage.ImageIndex := 2 else nMessage.ImageIndex := 1;
  end;

  va := True;
  gMessage.OnSelectCell(gMessage, 1, 1, va);
  end;
end;


procedure TfMessage.bbSendClick(Sender: TObject);
var
  str : String;
begin
  fMain.qTmp.SQL.Text := 'SELECT * FROM Users WHERE ID = '+ meDestination.Text;
  fMain.qTmp.Open;
  if fMain.qTmp.RecordCount = 0 then
  begin
    fMain.MyShowMessage('چنین عضوی وجود ندارد');
    Abort;
  end;

  if fMain.P_LS.ImageIndex = 0 then
    if fMain.loginMan <> fMain.qTmp.FieldByName('Man').AsBoolean then
    begin
      if fMain.loginMan then str := 'آقایان' else str := 'خانمها';
      fMain.MyShowMessage('شما تنها می توانید برای ' + str + ' پیغام بفرستید');
      Abort;
    end;

  fMain.executeCommand('INSERT INTO Messages (SourceID, DestinationID, Content, SendDate) VALUES ('+ lSource.Caption +', '+ meDestination.Text +', "'+ mContent.Text +'", "'+ fMain.getShamsiDate +'")');

  meDestination.Text := '';
  lName.Caption := '';
  mContent.Text := '';
  meDestination.SetFocus;
end;

procedure TfMessage.gMessageGetCellColor(Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if ARow <> 0 then
  if gMessage.Cells[0, Arow] = 'True' then ABrush.Color := $00FFE7D5 // blue
  else if AdvOfficeTabSet1.ActiveTabIndex = 2 then ABrush.Color := $0080FFFF
  else ABrush.Color := clWhite;
end;

procedure TfMessage.gMessageSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  state : Boolean;
begin
  if qMessage.Active then
  begin
  if qMessage.RecordCount > 0 then
  begin
    qMessage.RecNo := ARow;
    if qMessage.FieldByName('SourceID').AsString <> '' then
    begin
      lSourceRead.Caption := qMessage.FieldByName('SourceID').AsString;
      lSendDate.Caption := qMessage.FieldByName('SendDate').AsString;
      mContentRead.Text := qMessage.FieldByName('Content').AsString;
      if fMain.loginUserID = qMessage.FieldByName('DestinationID').AsString then
      if not qMessage.FieldByName('Viewed').AsBoolean then
        fMain.executeCommand('UPDATE Messages SET Viewed = True WHERE ID = '+ qMessage.FieldByName('ID').AsString);
    end;
  end else
  begin
    lSourceRead.Caption := '';
    lSendDate.Caption := '';
    mContentRead.Text := '';
  end;
  end;
end;

procedure TfMessage.FormCreate(Sender: TObject);
begin
  gMessage.FixedCols := 0;
  gMessage.Options := gMessage.Options + [goRowSelect, goEditing];
end;

procedure TfMessage.meDestinationKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  str : String;
begin
  if Key = 13 then
  begin
    fMain.qTmp.SQL.Text := 'SELECT * FROM Users WHERE ID = '+ meDestination.Text;
    fMain.qTmp.Open;
    if fMain.qTmp.RecordCount = 0 then
    begin
      fMain.MyShowMessage('چنین عضوی وجود ندارد');
      Abort;
    end;

    if fMain.P_LS.ImageIndex = 0 then
    if fMain.loginMan <> fMain.qTmp.FieldByName('Man').AsBoolean then
    begin
      if fMain.loginMan then str := 'آقایان' else str := 'خانمها';
      fMain.MyShowMessage('شما تنها می توانید برای ' + str + ' پیغام بفرستید');
      Abort;
    end;

    lName.Caption := fMain.qTmp.FieldByName('LastName').AsString;
    mContent.SetFocus;
  end;
end;

end.
