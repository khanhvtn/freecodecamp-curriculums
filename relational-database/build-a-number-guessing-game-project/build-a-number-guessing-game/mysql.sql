create database number_guess;
create table users(id serial primary key, username varchar(22) unique,games_played int, best_game int);
insert into users(username, games_played, best_game) values('khanhvtn',1,1);
ALTER TABLE users ALTER COLUMN games_played SET DEFAULT 0;
ALTER TABLE users ALTER COLUMN best_game SET DEFAULT 0;
