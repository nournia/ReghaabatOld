unit uShamsiDate;

interface

function ShamsiDate(EMroz :TDateTime;INdex:Byte):String;
function DayToDay(FRomDate,TODate: string): integer ;

implementation

uses SysUtils;

function ShamsiDate(EMroz :TDateTime; INdex:Byte):String;
var SUm ,YEar ,MOnt ,DAy :Word; Y ,M ,D :String;
begin
  DecodeDate(EMroz,YEar,MOnt,DAy);
  case MOnt of
    1: SUm:=0;
    2: SUm:=31;
    3: SUm:=59;
    4: SUm:=90;
    5: SUm:=120;
    6: SUm:=151;
    7: SUm:=181;
    8: SUm:=212;
    9: SUm:=243;
    10: SUm:=273;
    11: SUm:=304;
    12: SUm:=334;
  end;
  SUm:=SUm+DAy;
  SUm:=SUm+(YEar-622-1380)*365+(YEar-622-1380)div 4+285;
  if (YEar mod 4 = 0)and(MOnt > 2) then SUm := SUm + 1;
  if (YEar mod 4 = 1)then SUm := SUm + 1;

  YEar:=1380+(SUm div 1461)*4;
  SUm:=SUm mod 1461;
  if SUm = 1460 then
   begin
      YEar:=YEar+3;
      SUm:=365;
   end
  else
   begin
      YEar:=YEar+(SUm div 365);
      SUm:=SUm mod 365;
   end;

  if SUm < 187 then
   begin
    MOnt:=(SUm div 31)+1;
    DAy:=(SUm mod 31)+1;
   end;
  if SUm > 186 then
   begin
    MOnt:=((SUm-186) div 30)+7;
    DAy:=((SUm-186) mod 30)+1;
   end;

  Y:=IntToStr(YEar);
  M:=IntToStr(MOnt);
  D:=IntToStr(DAy);
  if MOnt<10 then M:='0'+IntToStr(MOnt);
  if DAy<10 then D:='0'+IntToStr(DAy);

  case INdex of
    0: ShamsiDate:=Y+'/'+M+'/'+D;
    1:
     begin
        if MOnt < 7 then ShamsiDate:=('31')
        else if (MOnt = 12) and(YEar mod 4 <> 3) then ShamsiDate:=('29')
        else ShamsiDate:=('30');
     end;
    2: ShamsiDate:=IntToStr(DayOfWeek( EMroz - DAy +1) mod 7);
    3: ShamsiDate:=IntToStr(DAy);
    4: ShamsiDate:=IntToStr(MOnt);
    5: ShamsiDate:=IntToStr(YEar);
  end;
end;

function DayToDay(FRomDate,TODate: string): integer ;
var
	FRomYear, FRomMont, FRomDay, TOYear, TOMont, TODay, FRomNo, TONo : integer;
begin
  FRomYear := StrToInt(Copy(FRomDate,1,4));
  FRomMont := StrToInt(Copy(FRomDate,6,2));
  FRomDay := StrToInt(Copy(FRomDate,9,2));

  FRomNo:=(FRomYear-1380)*365+(FRomYear-1380)div 4+(FRomMont-1)*31+FRomDay;
  if FRomMont>7 then FRomNo:=FRomNo-(FRomMont-7);

  TOYear := StrToInt(Copy(TODate,1,4));
  TOMont:=StrToInt(Copy(TODate,6,2));
  TODay:=StrToInt(Copy(TODate,9,2));

  TONo:=(TOYear-1380)*365+(TOYear-1380)div 4+(TOMont-1)*31+TODay;
  if TOMont>7 then TONo:=TONo-(TOMont-7);

  DayToDay:= TONo-FRomNo;

  if (FRomMont>12) or (TOMont>12) or (TODay>31) or (FRomDay>31) then DayToDay:=-1381;
  if ((FRomMont>6) and (FRomDay>30)) or ((TOMont>6) and (TODay>30)) then DayToDay:=-1381;
  if ((FRomNo mod 1461<>0) and (FRomMont=12) and (FRomDay=30)) or ((TONo mod 1461<>0) and (TOMont=12) and (TODay=30)) then DayToDay:=-1381;
end;

end.
