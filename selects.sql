-- режиссер, который является и актером
select actor.first_name, actor.last_name from shows.actor
    join shows.director on shows.actor.first_name = shows.director.first_name and
                           shows.actor.last_name = shows.director.last_name;

-- сериалы, вышедшие не раньше 2017 года в США
select title, release_year from shows.tv_show
where release_year >= 2017 and country_name = (select country_name from shows.country where country.country_name = 'USA');

-- режиссеры, создавшие сериалы с рейтингом >= 8.5
select first_name, last_name from shows.director join
(select director_id from shows.show_directors where show_id in
(select show_id from shows.statistics where imdb_rating >= 8.5)) as best_dirs
on best_dirs.director_id = director.director_id;

-- сериалы с наибольшим рейтингом
select title, imdb_rating from shows.tv_show join
shows.statistics on tv_show.show_id = statistics.show_id
where imdb_rating = (select max(imdb_rating) from shows.statistics);

-- средний рейтинг среди испанских сериалов
select avg(imdb_rating) from shows.statistics join shows.tv_show
on statistics.show_id = tv_show.show_id
where country_name = 'Spain';

-- сериалы, у которых в сезоне в среднем не менее 7 серий
select title from shows.tv_show where n_episodes / tv_show.n_seasons >= 7;

-- количество немецких сериалов, имеющих рейтинг < 8
select count(tv_show.show_id) from shows.statistics
join shows.tv_show on statistics.show_id = tv_show.show_id
where country_name = 'Germany' and imdb_rating < 8;

-- имена актеров, сыгравших в сериале с наименьшим рейтингом
select first_name, last_name from shows.actor
where actor_id in (select actor_id from shows.show_cast join
shows.statistics on show_cast.show_id = statistics.show_id
where imdb_rating = (select min(imdb_rating) from shows.statistics));

-- сериалы, в которых играл Alex Lawther
select title from shows.tv_show join (select show_id from shows.show_cast where
actor_id = (select actor_id from shows.actor
where first_name = 'Alex' and last_name = 'Lawther')) as selected
on selected.show_id = tv_show.show_id;

-- компании, выпустившие российские сериалы
select company_name from shows.company join
(select company_id from shows.production_companies where show_id
in (select show_id from shows.tv_show where country_name = 'Russia')) as selected
on selected.company_id = company.company_id;

