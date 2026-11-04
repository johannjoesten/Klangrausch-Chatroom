-- Im Supabase-Dashboard: SQL Editor -> New query -> einfügen -> Run

-- 1) Die Tabelle 
create table messages (
  id         bigint generated always as identity primary key, 
  message    text not null
             check (char_length(btrim(message)) between 1 and 280),  -- Limit
  created_at timestamptz not null default now()
);

-- Zugriffsregeln (Row Level Security)
alter table messages enable row level security;

create policy "alle duerfen schreiben" on messages
  for insert to anon with check (true);

create policy "alle duerfen lesen" on messages
  for select to anon using (true);


-- Realtime einschalten
alter publication supabase_realtime add table messages;
