-- функция, скрывающая все символы, начиная с позиции start в строке data
create or replace function shows.hide_data(data text, start integer)
returns text as $$
    declare
        res text := data;
    begin
        res := concat(left(data, start), repeat('*', length(data) - start));
        return res;
    end;
$$ language plpgsql;


-- представление содержит скрытые имена и фамилии актеров
create or replace view shows.actors_info as
select shows.hide_data(first_name, 2) as first_name,
       shows.hide_data(last_name, 2) as last_name,
       country_name
from shows.actor;


-- представление содержит скрытые имена и фамилии режиссеров
create or replace view shows.directors_info as
select shows.hide_data(first_name, 1) as first_name,
       shows.hide_data(last_name, 1) as last_name,
       country_name
from shows.director;


-- полная информацию по сериалу с рейтингами
create or replace view shows.show_stats as
select title, genres, release_year, n_seasons, n_episodes, country_name,
       imdb_rating, rt_rating
from shows.tv_show
join shows.statistics
on tv_show.show_id = statistics.show_id;


-- список актеров к каждому сериалу
create or replace view shows.show_casts as
select title, string_agg(concat(first_name, ' ', last_name), ', ') as actor
from shows.tv_show join (shows.show_cast join shows.actor
on show_cast.actor_id = actor.actor_id)
on tv_show.show_id = show_cast.show_id
group by title;


-- подсчитывает количество актеров/режиссеров из этой страны
-- type == 'actor' / 'director'
create or replace function shows.count_by_country(country_name text, type text)
returns integer as $$
    declare
        res integer := 0;
    begin
        if type = 'actor' then
            execute format('select count(*)
                            from shows.actor
                            where country_name = ''%s''', country_name)
            into res;
        else
            execute format('select count(*)
                            from shows.director
                            where country_name = ''%s''', country_name)
            into res;
        end if;
        return res;
    end;
$$ language plpgsql;

-- количество снятых сериалов, известных актеров и режиссеров по странам
create or replace view shows.country_stats as
select
       country_name,
       count(tv_show.show_id) as n_shows,
       shows.count_by_country(country_name, 'actor') as n_actors,
       shows.count_by_country(country_name, 'director') as n_directors
from shows.statistics join shows.tv_show
on statistics.show_id = tv_show.show_id
group by country_name;


