create table groups (
  id   serial,
  name text not null,
  primary key(id)
);

create table items (
  id       serial,
  name     text not null,
  group_id integer,
  foreign key(group_id) references groups(id) on delete cascade,
  primary key(id)
);

create table votes (
  item_id integer not null,
  value   boolean not null,
  foreign key(item_id) references items(id) on delete cascade
);
