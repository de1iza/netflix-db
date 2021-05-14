-- средний рейтинг по сериалам каждой страны
select country_name, avg(imdb_rating)
from shows.statistics join shows.tv_show
on statistics.show_id = tv_show.show_id
group by country_name;

-- количество сериалов по каждой стране, средний рейтинг которых больше 8
select country_name, count(tv_show.show_id)
from shows.statistics join shows.tv_show
on statistics.show_id = tv_show.show_id
group by country_name
having avg(imdb_rating) > 8;

-- режиссеры, отсортированные в порядке уменьшения среднего рейтинга снятых ими сериалов
select director_id, avg(imdb_rating) as avg_rating
from shows.statistics join shows.show_directors
on statistics.show_id = show_directors.show_id
group by director_id order by avg_rating desc;

-- место сериала в рейтинге по оценке imdb среди сериалов этой же страны
select title, row_number() over(partition by country_name order by imdb_rating desc) as rank
from shows.tv_show join shows.statistics
on tv_show.show_id = statistics.show_id;

-- 5 наиболее старых сериалов
select * from (select title, row_number() over (order by release_year) as year_order
from shows.tv_show) as old_shows
where year_order <= 5;

