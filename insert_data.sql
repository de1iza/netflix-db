----------------------------------- COUNTRIES -----------------------------------

insert into shows.country(country_name) values('USA');
insert into shows.country(country_name) values('Germany');
insert into shows.country(country_name) values('Spain');
insert into shows.country(country_name) values('UK');
insert into shows.country(country_name) values('Israel');
insert into shows.country(country_name) values('Russia');

------------------------------------ TV SHOWS ------------------------------------

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Orange Is the New Black', array['Comedy', 'Drama'], 2013, 7, 91,
       (select country_name from shows.country where country_name='USA'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Dark', array['Science fiction', 'Thriller', 'Mystery'], 2017, 3, 26,
       (select country_name from shows.country where country_name='Germany'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Cable Girls', array['Period drama', 'Telenovela'], 2017, 5, 42,
       (select country_name from shows.country where country_name='Spain'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('The End of the F***ing World', array['Dark comedy', 'Drama'], 2017, 2, 16,
       (select country_name from shows.country where country_name='UK'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('How to Sell Drugs Online (Fast)', array['Comedy', 'Drama', 'Crime'], 2019, 2, 12,
       (select country_name from shows.country where country_name='Germany'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Money Heist', array['Crime', 'Drama', 'Thriller'], 2017, 2, 31,
       (select country_name from shows.country where country_name='Spain'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('The Queen''s Gambit', array['Period drama'], 2020, 1, 7,
       (select country_name from shows.country where country_name='USA'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Fauda', array['Action', 'Serial drama', 'Psychological drama'], 2015, 3, 36,
       (select country_name from shows.country where country_name='Israel'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Silver Spoon', array['Crime drama', 'Psychological thriller'], 2015, 3, 40,
       (select country_name from shows.country where country_name='Russia'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Mindhunter', array['Crime drama', 'Psychological thriller'], 2017, 2, 19,
       (select country_name from shows.country where country_name='USA'));

insert into shows.tv_show(title, genres, release_year, n_seasons, n_episodes, country_name)
values('Black Mirror', array['Science fiction', 'Satire', 'Thriller', 'Drama'], 2011, 5, 22,
       (select country_name from shows.country where country_name='UK'));

-------------------------------- PRODUCTION COMPANIES -------------------------------------------

insert into shows.company(company_name, country_name)
values('Bambú Producciones', (select country_name from shows.country where country_name='Spain'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Cable Girls'),
       (select company_id from shows.company where company_name='Bambú Producciones'));

insert into shows.company(company_name, country_name)
values('Lionsgate Television', (select country_name from shows.country where country_name='USA'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       (select company_id from shows.company where company_name='Lionsgate Television'));

insert into shows.company(company_name, country_name)
values('Wiedemann & Berg Television', (select country_name from shows.country where country_name='Germany'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Dark'),
       (select company_id from shows.company where company_name='Wiedemann & Berg Television'));

insert into shows.company(company_name, country_name)
values('Clerkenwell Films', (select country_name from shows.country where country_name='UK'));

insert into shows.company(company_name, country_name)
values('Dominic Buchanan', (select country_name from shows.country where country_name='UK'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select company_id from shows.company where company_name='Clerkenwell Films'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select company_id from shows.company where company_name='Dominic Buchanan'));

insert into shows.company(company_name, country_name)
values('bildundtonfabrik', (select country_name from shows.country where country_name='Germany'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       (select company_id from shows.company where company_name='bildundtonfabrik'));

insert into shows.company(company_name, country_name)
values('Vancouver Media', (select country_name from shows.country where country_name='Spain'));

insert into shows.company(company_name, country_name)
values('Atresmedia', (select country_name from shows.country where country_name='Spain'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Money Heist'),
       (select company_id from shows.company where company_name='Vancouver Media'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Money Heist'),
       (select company_id from shows.company where company_name='Atresmedia'));

insert into shows.company(company_name, country_name)
values('Flitcraft Ltd', (select country_name from shows.country where country_name='USA'));

insert into shows.company(company_name, country_name)
values('Wonderful Films', (select country_name from shows.country where country_name='USA'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       (select company_id from shows.company where company_name='Flitcraft Ltd'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       (select company_id from shows.company where company_name='Wonderful Films'));

insert into shows.company(company_name, country_name)
values('Yes', (select country_name from shows.country where country_name='Israel'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Fauda'),
       (select company_id from shows.company where company_name='Yes'));

insert into shows.company(company_name, country_name)
values('Sreda', (select country_name from shows.country where country_name='Russia'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Silver Spoon'),
       (select company_id from shows.company where company_name='Sreda'));

insert into shows.company(company_name, country_name)
values('Denver and Delilah Productions', (select country_name from shows.country where country_name='USA'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Mindhunter'),
       (select company_id from shows.company where company_name='Denver and Delilah Productions'));

insert into shows.company(company_name, country_name)
values('Zeppotron', (select country_name from shows.country where country_name='UK'));

insert into shows.company(company_name, country_name)
values('House of Tomorrow', (select country_name from shows.country where country_name='UK'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Black Mirror'),
       (select company_id from shows.company where company_name='Zeppotron'));

insert into shows.production_companies(show_id, company_id)
values((select show_id from shows.tv_show where title='Black Mirror'),
       (select company_id from shows.company where company_name='House of Tomorrow'));

---------------------------------- DIRECTORS -----------------------------------

insert into shows.director(first_name, last_name, country_name)
values('Jenji', 'Kohan', (select country_name from shows.country where country_name='USA'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       (select director_id from shows.director where first_name='Jenji' and last_name='Kohan'));

insert into shows.director(first_name, last_name, country_name)
values('Baran', 'bo Odar', (select country_name from shows.country where country_name='Germany'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Dark'),
       (select director_id from shows.director where first_name='Baran' and last_name='bo Odar'));

insert into shows.director(first_name, last_name, country_name)
values('Ramón', 'Campos', (select country_name from shows.country where country_name='Spain'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Cable Girls'),
       (select director_id from shows.director where first_name='Ramón' and last_name='Campos'));

insert into shows.director(first_name, last_name, country_name)
values('Jonathan', 'Entwistle', (select country_name from shows.country where country_name='UK'));

insert into shows.director(first_name, last_name, country_name)
values('Lucy', 'Tcherniak', (select country_name from shows.country where country_name='UK'));

insert into shows.director(first_name, last_name, country_name)
values('Lucy', 'Forbes', (select country_name from shows.country where country_name='UK'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select director_id from shows.director where first_name='Jonathan' and last_name='Entwistle'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select director_id from shows.director where first_name='Lucy' and last_name='Tcherniak'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select director_id from shows.director where first_name='Lucy' and last_name='Forbes'));

insert into shows.director(first_name, last_name, country_name)
values('Philipp', 'Käßbohrer', (select country_name from shows.country where country_name='Germany'));

insert into shows.director(first_name, last_name, country_name)
values('Matthias', 'Murmann', (select country_name from shows.country where country_name='Germany'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       (select director_id from shows.director where first_name='Philipp' and last_name='Käßbohrer'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       (select director_id from shows.director where first_name='Matthias' and last_name='Murmann'));

insert into shows.director(first_name, last_name, country_name)
values('Álex', 'Pina', (select country_name from shows.country where country_name='Spain'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Money Heist'),
       (select director_id from shows.director where first_name='Álex' and last_name='Pina'));

insert into shows.director(first_name, last_name, country_name)
values('Scott', 'Frank', (select country_name from shows.country where country_name='USA'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       (select director_id from shows.director where first_name='Scott' and last_name='Frank'));

insert into shows.director(first_name, last_name, country_name)
values('Lior', 'Raz', (select country_name from shows.country where country_name='Israel'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Fauda'),
       (select director_id from shows.director where first_name='Lior' and last_name='Raz'));

insert into shows.director(first_name, last_name, country_name)
values('Konstantin', 'Statskiy', (select country_name from shows.country where country_name='Russia'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Silver Spoon'),
       (select director_id from shows.director where first_name='Konstantin' and last_name='Statskiy'));

insert into shows.director(first_name, last_name, country_name)
values('Joe', 'Penhall', (select country_name from shows.country where country_name='USA'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Mindhunter'),
       (select director_id from shows.director where first_name='Joe' and last_name='Penhall'));

insert into shows.director(first_name, last_name, country_name)
values('Charlie', 'Brooker', (select country_name from shows.country where country_name='UK'));

insert into shows.show_directors(show_id, director_id)
values((select show_id from shows.tv_show where title='Black Mirror'),
       (select director_id from shows.director where first_name='Charlie' and last_name='Brooker'));


----------------------------------- STATISTICS -------------------------------------

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Orange Is the New Black'), 8.0, 90);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Dark'), 8.8, 95);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Cable Girls'), 7.6, default);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='The End of the F***ing World'), 8.1, 93);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'), 7.9, default);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Money Heist'), 8.3, 93);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'), 8.6, 97);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Fauda'), 8.2, 100);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Silver Spoon'), 7.7, default);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Mindhunter'), 8.6, 97);

insert into shows.statistics(show_id, imdb_rating, rt_rating)
values((select show_id from shows.tv_show where title='Black Mirror'), 8.8, 84);

--------------------------------- CAST ---------------------------------

insert into shows.actor(first_name, last_name, country_name)
values('Taylor', 'Schilling', (select country_name from shows.country where country_name='USA'));

insert into shows.actor(first_name, last_name, country_name)
values('Laura', 'Prepon', (select country_name from shows.country where country_name='USA'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       (select actor_id from shows.actor where first_name='Taylor' and last_name='Schilling'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       (select actor_id from shows.actor where first_name='Laura' and last_name='Prepon'));

insert into shows.actor(first_name, last_name, country_name)
values('Louis', 'Hofmann', (select country_name from shows.country where country_name='Germany'));

insert into shows.actor(first_name, last_name, country_name)
values('Maja', 'Schöne', (select country_name from shows.country where country_name='Germany'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Dark'),
       (select actor_id from shows.actor where first_name='Louis' and last_name='Hofmann'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Dark'),
       (select actor_id from shows.actor where first_name='Maja' and last_name='Schöne'));

insert into shows.actor(first_name, last_name, country_name)
values('Blanca', 'Suárez', (select country_name from shows.country where country_name='Spain'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Cable Girls'),
       (select actor_id from shows.actor where first_name='Blanca' and last_name='Suárez'));

insert into shows.actor(first_name, last_name, country_name)
values('Alex', 'Lawther', (select country_name from shows.country where country_name='UK'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       (select actor_id from shows.actor where first_name='Alex' and last_name='Lawther'));

insert into shows.actor(first_name, last_name, country_name)
values('Maximilian', 'Mundt', (select country_name from shows.country where country_name='Germany'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       (select actor_id from shows.actor where first_name='Maximilian' and last_name='Mundt'));

insert into shows.actor(first_name, last_name, country_name)
values('Úrsula', 'Corberó', (select country_name from shows.country where country_name='Spain'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Money Heist'),
       (select actor_id from shows.actor where first_name='Úrsula' and last_name='Corberó'));

insert into shows.actor(first_name, last_name, country_name)
values('Anya', 'Taylor-Joy', (select country_name from shows.country where country_name='USA'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       (select actor_id from shows.actor where first_name='Anya' and last_name='Taylor-Joy'));

insert into shows.actor(first_name, last_name, country_name)
values('Lior', 'Raz', (select country_name from shows.country where country_name='Israel'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Fauda'),
       (select actor_id from shows.actor where first_name='Lior' and last_name='Raz'));

insert into shows.actor(first_name, last_name, country_name)
values('Pavel', 'Priluchnyy', (select country_name from shows.country where country_name='Russia'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Silver Spoon'),
       (select actor_id from shows.actor where first_name='Pavel' and last_name='Priluchnyy'));

insert into shows.actor(first_name, last_name, country_name)
values('Jonathan', 'Groff', (select country_name from shows.country where country_name='USA'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Mindhunter'),
       (select actor_id from shows.actor where first_name='Jonathan' and last_name='Groff'));

insert into shows.actor(first_name, last_name, country_name)
values('Bryce Dallas', 'Howard', (select country_name from shows.country where country_name='USA'));

insert into shows.show_cast(show_id, actor_id)
values((select show_id from shows.tv_show where title='Black Mirror'),
       (select actor_id from shows.actor where first_name='Bryce Dallas' and last_name='Howard'));

----------------------------------- EPISODES -------------------------------------

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       'I Wasn''t Ready', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Orange Is the New Black'),
       'Tit Punch', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Dark'),
       'Secrets', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Dark'),
       'Lies', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Cable Girls'),
       'Chapter 1: Dreams', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Cable Girls'),
       'Chapter 2: Memories', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       default, 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='The End of the F***ing World'),
       default, 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       'Nerd Today, Boss Tomorrow', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='How to Sell Drugs Online (Fast)'),
       'Life''s Not Fair, Get Used to It', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Money Heist'),
       'Do as Planned', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Money Heist'),
       'Lethal Negligence', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       'Openings', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='The Queen''s Gambit'),
       'Exchanges', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Fauda'),
       'Episode 1.01', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Fauda'),
       'Episode 1.02', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Silver Spoon'),
       default, 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Silver Spoon'),
       default, 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Mindhunter'),
       'Episode 1', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Mindhunter'),
       'Episode 2', 2, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Black Mirror'),
       'The National Anthem', 1, 1);

insert into shows.episode(show_id, title, number_in_season, season)
values((select show_id from shows.tv_show where title='Black Mirror'),
       'Fifteen Million Merits"', 2, 1);
