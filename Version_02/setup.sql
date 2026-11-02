-- Im Supabase-Dashboard: SQL Editor -> New query -> einfügen -> Run

-- 1) Die Tabelle
create table messages (
  id         bigint generated always as identity primary key,  -- aufsteigende Nummer 1,2,3...
  message    text not null
             check (char_length(btrim(message)) between 1 and 280),  -- Limit auch in der Datenbank
  created_at timestamptz not null default now()
);

-- 2) Zugriffsregeln (Row Level Security): ohne Regel darf niemand etwas
alter table messages enable row level security;

create policy "alle duerfen schreiben" on messages
  for insert to anon with check (true);

create policy "alle duerfen lesen" on messages
  for select to anon using (true);

-- Es gibt absichtlich KEINE Regel für update/delete:
-- Löschen geht nur für dich im Dashboard (dort bist du Admin).

-- 3) Realtime einschalten (sonst kommen keine Live-Events an)
alter publication supabase_realtime add table messages;
