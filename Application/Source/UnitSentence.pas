unit UnitSentence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, ExtCtrls, AdvPanel, Grids, BaseGrid, AdvGrid,
  DBAdvGrid, DB, ADODB, AdvAppStyler, UnitMaster, StdCtrls;

type
  TF_Sentence = class(TMaster)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBAdvGrid1: TDBAdvGrid;
    AdvPanel1: TAdvPanel;
    BitBtn2: TAdvGlowButton;
    BitBtn1: TAdvGlowButton;
    fs: TAdvFormStyler;
    ps: TAdvPanelStyler;
    AdvGlowButton1: TAdvGlowButton;
    DeleteCommand: TADOCommand;
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Sentence: TF_Sentence;

implementation

uses UnitMain;

{$R *.dfm}

procedure TF_Sentence.BitBtn2Click(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'SELECT Jomle.Jomle, Jomle.Goyandeh FROM Jomle ORDER BY Jomle.Goyandeh, Jomle.Jomle;';
  ADOQuery1.Open;
end;

procedure TF_Sentence.AdvGlowButton1Click(Sender: TObject);
var
  r : integer;
begin
  r := DBAdvGrid1.Row;

  DeleteCommand.CommandText := 'DELETE Jomle.Jomle FROM Jomle WHERE (((Jomle.Jomle)="'+ DBAdvGrid1.Cells[0,r] +'"));';
  DeleteCommand.Execute;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TF_Sentence.BitBtn1Click(Sender: TObject);
begin
  ADOQuery1.AppendRecord(['','']);
end;

procedure TF_Sentence.FormCreate(Sender: TObject);
begin
  DBAdvGrid1.FixedCols := 0;
  DBAdvGrid1.Options := DBAdvGrid1.Options + [goEditing];
end;

end.
