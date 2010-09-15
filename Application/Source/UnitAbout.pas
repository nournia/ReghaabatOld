unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmartMessageBox, StdCtrls, AdvReflectionImage,
  ExtCtrls, AdvPanel, AdvAppStyler, UnitMaster;

type
  TfAbout = class(TMaster)
    P_Temp: TAdvPanel;
    Label2: TLabel;
    Label3: TLabel;
    AdvReflectionImage1: TAdvReflectionImage;
    ps: TAdvPanelStyler;
    fs: TAdvFormStyler;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

uses UnitMain;

{$R *.dfm}

end.
