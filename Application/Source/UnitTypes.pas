unit UnitTypes;

interface
type
  TUser = (uUser = 0, uOperator, uDesigner, uManager, uMaster, uAdmin);
  TGender = (gMale = 0, gFemale);
  TResourceContent = (rBook = 0, rMultiMedia, rWebPage);
  TListState = (lResource, lQuestionMatch, lInstructionMatch);
  TMatchState = (mActive, mDisabled, mImported);

  function UserToString(u : TUser) : string;
  function StringToUser(s : string) : TUser;

  function GenderToString(g : TGender) : string;
  function StringToGender(s : string) : TGender;

  function ResourceToString(r : TResourceContent) : string;
  function StringToResource(s : string) : TResourceContent;

  function StateToString(s : TMatchState) : string;
  function StringToState(s : string) : TMatchState;

  // translate
  function UserToPersian(u : TUser) : string;
  function ResourceToPersian(r : TResourceContent) : string;
  function StateToPersian(s : TMatchState) : string;
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
function StringToUser(s : string) : TUser;
begin
  if (s = 'user') or (s = '') then Result := uUser else
  if s = 'operator' then Result := uOperator else
  if s = 'designer' then Result := uDesigner else
  if s = 'manager' then Result := uManager else
  if s = 'master' then Result := uMaster else
  if s = 'admin' then Result := uAdmin;
end;

function GenderToString(g : TGender) : string;
begin
  case g of
    gMale: Result := 'male';
    gFemale: Result := 'female';
  end;
end;
function StringToGender(s : string) : TGender;
begin
  if s = 'male' then Result := gMale else
  if s = 'female' then Result := gFemale;
end;

function ResourceToString(r : TResourceContent) : string;
begin
  case r of
    rBook: Result := 'book';
    rMultiMedia: Result := 'multimedia';
    rWebPage: Result := 'webpage';
  end;
end;
function StringToResource(s : string) : TResourceContent;
begin
  if s = 'book' then Result := rBook else
  if s = 'multimedia' then Result := rMultiMedia else
  if s = 'webpage' then Result := rWebPage;
end;

function StateToString(s : TMatchState) : string;
begin
  case s of
    mActive: Result := 'active';
    mDisabled: Result := 'disabled';
    mImported: Result := 'imported';
  end;
end;
function StringToState(s : string) : TMatchState;
begin
  if s = 'active' then Result := mActive else
  if s = 'disabled' then Result := mDisabled else
  if s = 'imported' then Result := mImported;
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
    rMultiMedia: Result := 'چند رسانه‌ای';
    rWebPage: Result := 'صفحه وب';
  end;
end;
function StateToPersian(s : TMatchState) : string;
begin
  case s of
    mActive: Result := 'فعال';
    mDisabled: Result := 'غیر فعال';
    mImported: Result := 'وارد شده';
  end;
end;

end.
