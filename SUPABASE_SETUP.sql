-- SkateTech OS Supabase backend setup
-- Run this once in Supabase SQL Editor.
-- This stores one complete SkateTech app state per signed-in user.

create table if not exists public.skatetech_app_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null,
  client_updated_at timestamptz,
  updated_at timestamptz not null default now()
);

alter table public.skatetech_app_state enable row level security;

drop policy if exists "Users can read their SkateTech state" on public.skatetech_app_state;
create policy "Users can read their SkateTech state"
on public.skatetech_app_state
for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their SkateTech state" on public.skatetech_app_state;
create policy "Users can insert their SkateTech state"
on public.skatetech_app_state
for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their SkateTech state" on public.skatetech_app_state;
create policy "Users can update their SkateTech state"
on public.skatetech_app_state
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete their SkateTech state" on public.skatetech_app_state;
create policy "Users can delete their SkateTech state"
on public.skatetech_app_state
for delete
to authenticated
using (auth.uid() = user_id);

create or replace function public.set_skatetech_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_skatetech_app_state_updated_at on public.skatetech_app_state;
create trigger set_skatetech_app_state_updated_at
before update on public.skatetech_app_state
for each row
execute function public.set_skatetech_updated_at();
