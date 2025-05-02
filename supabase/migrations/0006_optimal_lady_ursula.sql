-- Custom SQL migration file, put your code below! --
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP TRIGGER IF EXISTS on_auth_user_verified ON auth.users;
DROP FUNCTION IF EXISTS public.handle_new_user();

-- inserts a row into public.profile
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, is_staff, university_id)
  values (
    new.id,
    (new.raw_user_meta_data->>'is_staff')::boolean,
    (new.raw_user_meta_data->>'university')::integer
  );
  return new;
end;
$$;

-- trigger the function every time a user is created
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();