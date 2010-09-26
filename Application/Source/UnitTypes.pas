unit UnitTypes;

interface
type
  TUser = (uUser = 0, uOperator, uDesigner, uManager, uMaster, uAdmin);
  TGender = (gMale = 0, gFemale);
  TResourceContent = (rBook = 0, rAudio, rVideo, rWebPage);

  function UserToString(u : TUser) : string;
  function StringToUser(u : string) : TUser;

  function GenderToString(g : TGender) : string;
  function StringToGender(g : string) : TGender;

  function ResourceToString(r : TResourceContent) : string;
  function StringToResource(r : string) : TResourceContent;

  function UserToPersian(u : TUser) : string;
  function ResourceToPersian(r : TResourceContent) : string;
implementation

function UserToString(u : TUser) : string;
begin
  case u of
    uUser: Result := 'user';
    uOperator: Result := 'operator';
    uDesigner: Result := 'designer';
    uManager: Result := 'manager';
    uMaster: Result := 'master';
    uAdmin: Result := 'admin';
  end;
end;
function StringToUser(u : string) : TUser;
begin
  if (u = 'user') or (u = '') then Result := uUser else
  if u = 'operator' then Result := uOperator else
  if u = 'designer' then Result := uDesigner else
  if u = 'manager' then Result := uManager else
  if u = 'master' then Result := uMaster else
  if u = 'admin' then Result := uAdmin;
end;

function GenderToString(g : TGender) : string;
begin
  case g of
    gMale: Result := 'male';
    gFemale: Result := 'female';
  end;
end;
function StringToGender(g : string) : TGender;
begin
  if g = 'male' then Result := gMale else
  if g = 'female' then Result := gFemale;
end;

function ResourceToString(r : TResourceContent) : string;
begin
  case r of
    rBook: Result := 'book';
    rAudio: Result := 'audio';
    rVideo: Result := 'video';
    rWebPage: Result := 'webpage';
  end;
end;
function StringToResource(r : string) : TResourceContent;
begin
  if r = 'book' then Result := rBook else
  if r = 'audio' then Result := rAudio else
  if r = 'video' then Result := rVideo else
  if r = 'webpage' then Result := rWebPage;
end;

function UserToPersian(u : TUser) : string;
begin
  case u of
    uUser: Result := 'عضو';
    uOperator: Result := 'عضویار';
    uDesigner: Result := 'طراح';
    uManager: Result := 'طراح‌یار';
    uMaster: Result := 'مدیر';
    uAdmin: Result := 'مدیر کل';
  end;
end;
function ResourceToPersian(r : TResourceContent) : string;
begin
  case r of
    rBook: Result := 'کتاب';
    rAudio: Result := 'صوتی';
    rVideo: Result := 'تصویری';
    rWebPage: Result := 'صفحه وب';
  end;
end;

end.
