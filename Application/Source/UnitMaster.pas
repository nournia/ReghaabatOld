unit UnitMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TMaster = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Master: TMaster;

implementation

{$R *.dfm}

procedure TMaster.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #1610 then key := #1740;
  if key = #34 then key := #39;

//  IF Key = #223 then Key := #152;
//  IF Key = #236 then Key := #237;
end;

end.
