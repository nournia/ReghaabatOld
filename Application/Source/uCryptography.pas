unit uCryptography;

interface

function md5(input : string) : string;
function sha1(input : string) : string;
function encrypt(input : string) : string;
function decrypt(input : string) : string;
function LicenceToShamsi(var Beg, En : String; Licence, ComputerID: String):String ;
function ShamsiToLicence(BeginShamsi, EndShamsi, ComputerID: String):String ;
function getComputerID(sha : boolean = false): String;

implementation

uses SysUtils, StrUtils, magwmi, magsubs1, DCPcrypt2, DCPrijndael, DCPmd5, DCPsha1, DCPbase64;

function md5(input : string) : string;
const HASHSIZE_BYTES = 16;
var digest: array[0..HASHSIZE_BYTES - 1] of byte; i: integer;
begin
  with TDCP_md5.Create(nil) do
  try
    Init();
    UpdateStr(input);
    final(digest[0]);
    result := '';
    for i := 0 to HASHSIZE_BYTES - 1 do
      result := result + IntToHex((Digest[i]), 2);
    result := LowerCase(result);
  finally
    Free();
  end;
end;

function sha1(input : string) : string;
const HASHSIZE_BYTES = 20;
var digest: array[0..HASHSIZE_BYTES - 1] of byte; i: integer;
begin
  with TDCP_sha1.Create(nil) do
  try
    Init();
    UpdateStr(input);
    final(digest[0]);
    result := '';
    for i := 0 to HASHSIZE_BYTES - 1 do
      result := result + IntToHex((Digest[i]), 2);
    result := LowerCase(result);
  finally
    Free();
  end;
end;

function PadWithZeros(const str : string; size : integer) : string;
var
  origsize, i : integer;
begin
  Result := str;
  origsize := Length(Result);
  if ((origsize mod size) <> 0) or (origsize = 0) then
  begin
    SetLength(Result,((origsize div size)+1)*size);
    for i := origsize+1 to Length(Result) do
      Result[i] := #0;
  end;
end;

function encrypt(input : string) : string;
var cipher : TDCP_rijndael; data, key, iv : AnsiString;
begin
  key := 'lkarwb897r2pdbztrmskarzhqqd498j5'; iv := 'hbadrfjhajhlanoj';
  data := input; data := PadWithZeros(data, 16);

  cipher := TDCP_rijndael.Create(nil);
  cipher.Init(key[1],256,@iv[1]);
  cipher.EncryptCBC(data[1],data[1],Length(data));
  cipher.Free;
  FillChar(key[1],Length(key),0);
  Result := Base64EncodeStr(data);
end;

function decrypt(input : string) : string;
var cipher : TDCP_rijndael; data, key, iv : AnsiString;
begin
  key := 'lkarwb897r2pdbztrmskarzhqqd498j5'; iv := 'hbadrfjhajhlanoj';
  data := input; data := Base64DecodeStr(data);

  cipher := TDCP_rijndael.Create(nil);
  cipher.Init(key[1],256,@IV[1]);
  cipher.DecryptCBC(data[1],data[1],Length(data));
  cipher.Free;
  FillChar(key[1],Length(key),0);
  Result := TrimRight(data);
end;


function ShamsiToLicence(BeginShamsi, EndShamsi, ComputerID: String):String ;
begin
   Result := encrypt(BeginShamsi + ComputerID + EndShamsi);
end;

function LicenceToShamsi( var Beg, En : String; Licence, ComputerID: String):String ;
begin
  Result := decrypt(Licence);
  Beg := LeftStr(Result, 10);
  En := RightStr(Result, 10);
  if (Copy(Beg, 5, 1) <> '/') or (Copy(Beg, 8, 1) <> '/') or (Copy(En, 5, 1) <> '/') or (Copy(En, 8, 1) <> '/') then
    Result := '1300/00/00';
end;

function getComputerID(sha : boolean): String;
var rows, instances, I, J: integer; WmiResults: T2DimStrArray; sSelectClass : String;
begin
  try
    sSelectClass := 'SELECT Product, Manufacturer, SerialNumber FROM Win32_BaseBoard';
    rows := MagWmiGetInfo ('', 'root\CIMV2', '', '', sSelectClass, WmiResults, instances);
    if rows > 0 then
    begin
      for I := 1 to rows do
        Result := Result + WmiResults [1, I];
    end else Result := '';
  finally
    WmiResults := Nil;
    if Result <> '' then
      if sha then Result := sha1(Result) else Result := md5(Result);
  end;
end;

end.
