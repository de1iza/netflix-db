create table tv_show(
    show_id serial primary key,
    title text not null,
    genre text,
    release_date date,
    n_seasons integer,
    n_episodes integer);

create table director(
    director_id serial primary key,
    first_name text not null,
    last_name text);

create table episode(
    episode_id serial primary key,
    show_id serial references tv_show(show_id),
    title text,
    number_in_season integer not null,
    season integer not null
);

create table statistics(
    show_id serial primary key references tv_show(show_id),
    imdb_rating float,
    check (imdb_rating between 1 and 10),
    rt_rating float,
    check (rt_rating between 0 and 100)
);

create table country(
    country_name text primary key
);

create table company(
    company_id serial primary key,
    company_name text,
    country_name text references country(country_name)
);

create table actor(
    actor_id serial primary key,
    first_name text not null,
    last_name text,
    country_name text references country(country_name)
);

alter table tv_show add country_name text references country(country_name);

alter table director add country_name text references country(country_name);

create table show_cast(
    id serial primary key,
    show_id serial references tv_show(show_id),
    actor_id serial references actor(actor_id)
);

create table show_companies(
    id serial primary key,
    show_id serial references tv_show(show_id),
    company_id serial references company(company_id)
);

alter table show_companies rename to production_companies;

create table show_directors(
    id serial primary key,
    show_id serial references tv_show(show_id),
    director_id serial references director(director_id)
);
