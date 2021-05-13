create schema shows;

create table shows.tv_show(
    show_id serial primary key,
    title text not null,
    genres text array,
    release_year integer,
    check (release_year between 1900 and 2021),
    n_seasons integer,
    n_episodes integer);

create table shows.director(
    director_id serial primary key,
    first_name text not null,
    last_name text);

create table shows.episode(
    episode_id serial primary key,
    show_id serial references shows.tv_show(show_id),
    title text,
    number_in_season integer not null,
    season integer not null
);

create table shows.statistics(
    show_id serial primary key references shows.tv_show(show_id),
    imdb_rating float,
    check (imdb_rating between 1 and 10),
    rt_rating float,
    check (rt_rating between 0 and 100)
);

create table shows.country(
    country_name text primary key
);

create table shows.company(
    company_id serial primary key,
    company_name text,
    country_name text references shows.country(country_name)
);

create table shows.actor(
    actor_id serial primary key,
    first_name text not null,
    last_name text,
    country_name text references shows.country(country_name)
);

alter table shows.tv_show add country_name text references shows.country(country_name);

alter table shows.director add country_name text references shows.country(country_name);

create table shows.show_cast(
    id serial primary key,
    show_id serial references shows.tv_show(show_id),
    actor_id serial references shows.actor(actor_id)
);

create table shows.show_companies(
    id serial primary key,
    show_id serial references shows.tv_show(show_id),
    company_id serial references shows.company(company_id)
);

alter table shows.show_companies rename to production_companies;

create table shows.show_directors(
    id serial primary key,
    show_id serial references shows.tv_show(show_id),
    director_id serial references shows.director(director_id)
);


