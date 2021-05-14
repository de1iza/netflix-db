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

-----------------------------------------------------------------------------------------------------------------
-- функция для триггера, логирует изменения, записывая изменения в отдельную таблицу
create or replace function shows.log_change()
returns trigger as $logs$
    begin
        create table if not exists shows.logs(
            operation char(1) not null,
            time timestamp not null,
            userid text not null,
            title text not null,
            genres text array,
            release_year integer,
            n_seasons integer,
            n_episodes integer
        );
        if (TG_OP = 'DELETE') then
            insert into shows.logs select 'D', now(), user, old.title, old.genres, old.release_year, old.n_seasons, old.n_episodes;
            return old;
        elseif (TG_OP = 'UPDATE') then
            insert into shows.logs select 'U', now(), user, new.title, new.genres, new.release_year, new.n_seasons, new.n_episodes;
            return new;
        elseif (TG_OP = 'INSERT') then
            insert into shows.logs select 'I', now(), user, new.title, new.genres, new.release_year, new.n_seasons, new.n_episodes;
            return new;
        end if;
        return null;
    end;
$logs$ language plpgsql;


-- триггер, вызывается при вставке / изменении / удалении, логирует изменения
create trigger log_update
    after insert or update or delete on shows.tv_show
    for each row
    execute procedure shows.log_change();

-- тест
insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Test1', array['Comedy'], 2020, 7, 101,
       (select country_name from shows.country where country_name='UK'));

--------------------------------------------------------------------------------------------------------------------
-- функция для триггера, изменяет формат входных данных (названия стран)
create or replace function shows.process_country()
returns trigger as $$
    begin
        if new.country_name = 'United Kingdom' then
            new.country_name := 'UK';
        elseif new.country_name = 'United States of America' then
            new.country_name := 'USA';
        end if;
        return new;
    end;
$$ language plpgsql;

-- триггер, вызывается перед вставкой / изменением таблицы со странами, изменяет формат названия
create trigger process_input
    before insert or update on shows.country
    for each row
    execute procedure shows.process_country();

-- тест
insert into shows.country(country_name)
values('United Kingdom');
