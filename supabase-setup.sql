-- Jalankan sekali di Supabase: SQL Editor > New query > Run
create table if not exists public.gw_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.gw_state enable row level security;
grant select, insert, update on public.gw_state to anon;

drop policy if exists "gw anon select" on public.gw_state;
drop policy if exists "gw anon insert" on public.gw_state;
drop policy if exists "gw anon update" on public.gw_state;
create policy "gw anon select" on public.gw_state for select to anon using (true);
create policy "gw anon insert" on public.gw_state for insert to anon with check (true);
create policy "gw anon update" on public.gw_state for update to anon using (true) with check (true);

-- Izin hapus (dipakai tombol "Reset semua data")
grant delete on public.gw_state to anon;
drop policy if exists "gw anon delete" on public.gw_state;
create policy "gw anon delete" on public.gw_state for delete to anon using (true);
