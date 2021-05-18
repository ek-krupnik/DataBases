create schema medialibrary;

set search_path = medialibrary;

create table if not exists "additional info"
(
    film_id             integer not null unique,
    subtitles_flg       boolean default false,
    info_desc           text,
    language_txt        varchar(20),
    country_nm          varchar(40),
    video_quality_name  integer default 1080,
    release_dt          date,
    duration_min        time not null,

    foreign key (film_id)  references "media library" (film_id)  on delete cascade on update cascade
);
drop table "additional info";

create table if not exists "media library"
(
    film_id             serial primary key,
    film_nm             varchar(40) not null,
    film_type           varchar(10) not null,
    MPAA_rating_txt     varchar(10),
    IMDb_rating_rate    numeric(5, 2),
    number_of_views_amt numeric(5, 2)
);
drop table "media library" cascade;

create table if not exists awards
(
    award_id      serial primary key,
    award_nm      varchar(30),
    info_dscr     varchar(200),
    foundation_dt date
);

create table if not exists "awards_X_media library"
(
    film_id    integer,
    award_id   integer,
    awarded_dt date,

    foreign key (film_id)  references "media library" (film_id)  on delete cascade on update cascade,
    foreign key (award_id) references  awards         (award_id) on delete cascade on update cascade
);
drop table "awards_X_media library";

create table if not exists actors
(
  actor_id          serial primary key,
  first_nm          varchar(30) not null,
  second_nm         varchar(30) not null,
  births_dt         date,
  height_amt        integer,
  citizenship_txt   varchar(15)
);
drop table actors cascade ;

create table if not exists "actors_X_media library"
(
    film_id           integer,
    actor_id          integer,
    main_caracter_flg bool default false,

    foreign key (film_id)  references "media library" (film_id)  on delete cascade on update cascade,
    foreign key (actor_id) references  actors         (actor_id) on delete cascade on update cascade
);

create table if not exists "all genres"
(
    genre_id serial primary key,
    genre_nm varchar(30),
    info_dscr varchar(200)
);

create table if not exists "all genres_X_Media library"
(
    film_id           integer,
    genre_id          integer,

    foreign key (film_id)  references "media library" (film_id)  on delete cascade on update cascade,
    foreign key (genre_id) references  "all genres"   (genre_id) on delete cascade on update cascade
);

insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Анджелина',
        'Джоли',
        '04-06-1975',
        169,
        'США'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Брэд',
        'Питт',
        '18-12-1963',
        180,
        'США'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Дженнифер',
        'Энистон',
        '11-02-1969',
        164,
        'США'
    );

insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Джордж',
        'Клуни',
        '06-05-1961',
        180,
        'США'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Бенедикт',
        'Камбербэтч',
        '19-06-1976',
        183,
        'Великобритания'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Роберт',
        'Дауни мл.',
        '04-04-1965',
        174,
        'США'
    );

insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Том',
        'Холланд',
        '01-06-1996',
        173,
        'Великобритания'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Крис',
        'Хемсворт',
        '11-09-1983',
        190,
        'Австралия'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Том',
        'Круз',
        '03-07-1962',
        170,
        'США'
    );

insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Крис',
        'Эванс',
        '13-06-1981',
        183,
        'США'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Дэниэл',
        'Рэдклифф',
        '23-07-1989',
        165,
        'Великобритания'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Эмма',
        'Уотсон',
        '15-04-1990',
        165,
        'Франция'
    );

insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Светлана',
        'Ходченкова',
        '21-01-1983',
        179,
        'Россия'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Хью',
        'Джекман',
        '12-10-1968',
        188,
        'Австралия'
    );
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Мартин',
        'Фриман',
        '08-09-1971',
        170,
        'Австралия'
    );

select *
    from actors;

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Шерлок',
        'сериал',
        '12+',
        8.9,
        406
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        1,
        TRUE,
        'События разворачиваются в наши дни. Он прошел Афганистан, остался инвалидом. По возвращении в родные края ' ||
        'встречается с загадочным, но своеобразным гениальным человеком. Тот в поиске соседа по квартире. Лондон,' ||
        ' 2010 год. Происходят необъяснимые убийства.',
        'русский',
        'Великобританя',
        1080,
        '22.07.2010',
        '01:30:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Шерлок Холмс',
        'сериал',
        '12+',
        8.1,
        404
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        2,
        TRUE,
        'Спасти Лондон от зловещего чернокнижника: Гай Ричи превращает рассказы Конан Дойла в мощный детективный экшен',
        'русский',
        'Великобританя',
        1080,
        '14.12.2009',
        '02:30:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Человек-паук: Возвращение домой',
        'фильм',
        '16+',
        7.1,
        230
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        3,
        TRUE,
        'Юный Спайдермен добивается места в команде Мстителей. Перезагрузка франшизы – теперь в киновселенной Marvel',
        'русский',
        'Великобританя',
        1080,
        '28.06.2017',
        '02:10:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Однажды в… Голливуде',
        'фильм',
        '18+',
        7.6,
        30
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        4,
        TRUE,
        'Можно ли переписать историю? Самый ностальгический фильм Тарантино — с Шэрон Тейт, Брюсом Ли и Чарли Мэнсоном',
        'русский',
        'Великобританя',
        1080,
        '08.08.2019',
        '02:20:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Люди Икс',
        'фильм',
        '12+',
        7.7,
        196
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        5,
        FALSE,
        'Есть ли место мутантам в мире людей? Первое знакомство с командой супергероев из комиксов Marvel',
        'русский',
        'США',
        1080,
        '12.06.2000',
        '01:45:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Гарри Поттер и философский камень',
        'фильм',
        '12+',
        8.2,
        552
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        6,
        FALSE,
        'Гарри поступает в школу магии Хогвартс и заводит друзей. Первая часть большой франшизы о маленьком волшебнике',
        'русский',
        'США',
        1080,
        '04.11.2001',
        '02:32:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Гарри Поттер и Тайная комната',
        'фильм',
        '12+',
        8.0,
        387
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        7,
        FALSE,
        'Домашний эльф, магический дневник и привидение. Второй год Гарри в школе Хогвартс — еще более захватывающий',
        'русский',
        'США',
        1080,
        '03.11.2002',
        '02:41:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Гарри Поттер и Принц-полукровка',
        'фильм',
        '12+',
        7.7,
        333
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        8,
        FALSE,
        'Гарри помогает Дамблдору раскрыть главную тайну Волан-де-Морта. Шестая часть с душераздирающим финалом',
        'русский',
        'США',
        1080,
        '06.07.2009',
        '02:33:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Хоббит: Пустошь Смауга',
        'фильм',
        '12+',
        8.0,
        314
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        9,
        TRUE,
        'Бильбо и гномы все ближе к Одинокой горе, где их ждет дракон Смауг. Возвращение Орландо Блума к роли Леголаса',
        'русский',
        'Новая Зеландия',
        1080,
        '02.12.2013',
        '02:41:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Мстители: Финал',
        'фильм',
        '12+',
        7.6,
        472
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        10,
        TRUE,
        'Железный человек, Тор и другие пытаются переиграть Таноса. Эпохальное завершение супергеройской франшизы',
        'русский',
        'США',
        1080,
        '22.04.2019',
        '03:01:00'
    );

insert into "media library" (film_nm, film_type, MPAA_rating_txt, IMDb_rating_rate, number_of_views_amt) VALUES
    (
        'Мстители: Война бесконечности',
        'фильм',
        '16+',
        7.9,
        547
    );
insert into "additional info" (film_id, subtitles_flg, info_desc, language_txt, country_nm, video_quality_name,
                               release_dt, duration_min) VALUES
    (
        11,
        TRUE,
        'Предпоследний фильм о суперкоманде Marvel. Титан Танос вынашивает страшный план – угрозу всей Вселенной',
        'русский',
        'США',
        1080,
        '23.04.2018',
        '02:29:00'
    );

insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Оскар',
     'Оскар считается главной кинематографической премией в США.',
     '16.05.1929'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Золотой глобус',
     'Церемония вручения наград «Золотой Глобус» является своеобразной разминкой перед вручением «Оскара» - ' ||
     'зачастую лауреаты этой премии становятся и обладателями золотых статуэток.',
     '25.01.1944'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Британская академия',
     'BAFTA (англ. The British Academy of Film and Television Arts) - премия Британской академии кино и ' ||
     'телевизионных искусств, являющаяся главной церемонией вручения наград в Великобритании.',
     '15.11.1948'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Ника',
     'Премия «Ника» была учреждена в 1987 году Секретариатом Союза кинематографистов СССР.',
     '09.05.1988'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Каннский кинофестиваль',
     'Международный Каннский кинофестиваль считается самым престижным кинофестивалем в мире.',
     '12.09.1939'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Сатурн',
     'Сатурн (Saturn Award) - американская кинопремия, вручаемая Академией научной фантастики, фэнтези и фильмов ' ||
     'ужасов с 1972 года по результатам голосования членов Академии.',
     '18.05.1973'
    );
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Эмми',
     'Премия «Эмми» считается американским телевизионным эквивалентом премии «Оскар».',
     '25.01.1949'
    );

select *
    from "additional info";

select *
    from  "media library";

select *
    from actors;

select *
    from awards;

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Хоббит: Пустошь Смауга'),
        (select award_id from awards where award_nm = 'Сатурн'),
        '26.06.2014'
    );

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок'),
        (select award_id from awards where award_nm = 'Эмми'),
        '15.01.2014'
    );

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок Холмс'),
        (select award_id from awards where award_nm = 'Золотой глобус'),
        '17.01.2010'
    );

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select award_id from awards where award_nm = 'Оскар'),
        '09.02.2020'
    );
insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select award_id from awards where award_nm = 'Золотой глобус'),
        '05.01.2020'
    );
insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select award_id from awards where award_nm = 'Британская академия'),
        '02.02.2020'
    );
insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select award_id from awards where award_nm = 'Каннский кинофестиваль'),
        '12.09.2019'
    );

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Люди Икс'),
        (select award_id from awards where award_nm = 'Сатурн'),
        '25.11.2001'
    );

insert into "awards_X_media library" (film_id, award_id, awarded_dt) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и философский камень'),
        (select award_id from awards where award_nm = 'Сатурн'),
        '21.11.2002'
    );

select *
    from "awards_X_media library";

insert into "actors_X_media library" (film_id, actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок'),
        (select actor_id from actors where second_nm = 'Камбербэтч'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок'),
        (select actor_id from actors where second_nm = 'Фриман'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select actor_id from actors where second_nm = 'Питт'),
        FALSE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Хоббит: Пустошь Смауга'),
        (select actor_id from actors where second_nm = 'Камбербэтч'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select actor_id from actors where second_nm = 'Дауни мл.'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select actor_id from actors where second_nm = 'Дауни мл.'),
        TRUE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой'),
        (select actor_id from actors where second_nm = 'Дауни мл.'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой'),
        (select actor_id from actors where second_nm = 'Холланд'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select actor_id from actors where second_nm = 'Холланд'),
        FALSE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select actor_id from actors where second_nm = 'Холланд'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select actor_id from actors where second_nm = 'Хемсворт'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select actor_id from actors where second_nm = 'Хемсворт'),
        FALSE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой'),
        (select actor_id from actors where second_nm = 'Эванс'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select actor_id from actors where second_nm = 'Эванс'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select actor_id from actors where second_nm = 'Эванс'),
        FALSE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и философский камень'),
        (select actor_id from actors where second_nm = 'Рэдклифф'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Тайная комната'),
        (select actor_id from actors where second_nm = 'Рэдклифф'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Принц-полукровка'),
        (select actor_id from actors where second_nm = 'Рэдклифф'),
        TRUE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и философский камень'),
        (select actor_id from actors where second_nm = 'Уотсон'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Тайная комната'),
        (select actor_id from actors where second_nm = 'Уотсон'),
        TRUE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Принц-полукровка'),
        (select actor_id from actors where second_nm = 'Уотсон'),
        TRUE
    );

insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Люди Икс'),
        (select actor_id from actors where second_nm = 'Ходченкова'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Люди Икс'),
        (select actor_id from actors where second_nm = 'Джекман'),
        FALSE
    );
insert into "actors_X_media library" (film_id,  actor_id, main_caracter_flg) values
    (
        (select film_id from "media library" where film_nm = 'Хоббит: Пустошь Смауга'),
        (select actor_id from actors where second_nm = 'Фриман'),
        TRUE
    );

select * from "actors_X_media library";

insert into "all genres" (genre_nm, info_dscr) values
    (
        'фэнтези',
        'жанр игрового кинематографа, в основе произведений которого лежат сказочные и мифологические мотивы'
    );
insert into "all genres" (genre_nm, info_dscr) values
    (
        'детектив',
        'жанр кинематографа, главный герои или герои которого пытаются найти решение какой-либо проблемы или раскрыть ' ||
        'преступление'
    );
insert into "all genres" (genre_nm, info_dscr) values
    (
        'боевик',
        'инематографический жанр, в котором главный герои или герои сталкиваются с рядом проблем, решить которые, ' ||
        'не прибегнув к насилию, не удается'
    );
insert into "all genres" (genre_nm, info_dscr) values
    (
        'драма',
        'эти фильмы повествуют о частной жизни и социальных конфликтах персонажей, акцентируя внимание на ' ||
        'воплощенных в их поступках и поведении общечеловеческих противоречиях'
    );
insert into "all genres" (genre_nm, info_dscr) values
    (
        'комедия',
        'фильмы, призванные поднимать настроение и вызывать у зрителя смех'
    );
insert into "all genres" (genre_nm, info_dscr) values
    (
        'приключения',
        'жанр кинематографического искусства, характерными особенностями которого являются дух авантюризма'
    );

select * from "all genres";

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок'),
        (select genre_id from "all genres" where genre_nm = 'детектив')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок Холмс'),
        (select genre_id from "all genres" where genre_nm = 'детектив')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Шерлок Холмс'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой'),
        (select genre_id from "all genres" where genre_nm = 'боевик')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select genre_id from "all genres" where genre_nm = 'комедия')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Однажды в… Голливуде'),
        (select genre_id from "all genres" where genre_nm = 'боевик')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Люди Икс'),
        (select genre_id from "all genres" where genre_nm = 'боевик')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и философский камень'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и философский камень'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Тайная комната'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Тайная комната'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Принц-полукровка'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Гарри Поттер и Принц-полукровка'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Хоббит: Пустошь Смауга'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Хоббит: Пустошь Смауга'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select genre_id from "all genres" where genre_nm = 'боевик')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Финал'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );

insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select genre_id from "all genres" where genre_nm = 'боевик')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select genre_id from "all genres" where genre_nm = 'приключения')
    );
insert into "all genres_X_Media library" (film_id,  genre_id) values
    (
        (select film_id from "media library" where film_nm = 'Мстители: Война бесконечности'),
        (select genre_id from "all genres" where genre_nm = 'фэнтези')
    );

select * from "all genres_X_Media library";

--------------------------------
select first_nm, second_nm
    from actors
join "actors_X_media library"
    on actors.actor_id = "actors_X_media library".actor_id
    where "actors_X_media library".film_id = (select "media library".film_id from "media library" where film_nm = 'Шерлок')
    group by first_nm, second_nm; -- все актёры (имя, фамилия), которые играли в Шерлоке

-----------
select first_nm, second_nm
    from actors
join "actors_X_media library"
    on actors.actor_id = "actors_X_media library".actor_id
    where "actors_X_media library".film_id = (select "media library".film_id from "media library" where film_nm = 'Мстители: Финал')
    group by first_nm, second_nm
intersect
    select first_nm, second_nm
    from actors
join "actors_X_media library"
    on actors.actor_id = "actors_X_media library".actor_id
    where "actors_X_media library".film_id = (select "media library".film_id from "media library" where film_nm = 'Человек-паук: Возвращение домой')
    group by first_nm, second_nm; -- все актёры (имя, фамилия), которые играли в Мстители: Финал И в Человек-паук: Возвращение домой

-----------

select count (*)
    from "media library"
    where MPAA_rating_txt = '12+'
        and film_id in
            (
            select film_id
                from "additional info"
                where country_nm = 'США'); -- количество фильмов с рейтингом 12+, снятые в США

-----------

select avg(extract(min from duration_min))
    from "additional info"
join "media library" on "additional info".film_id = "media library".film_id
join "all genres_X_Media library" on "media library".film_id = "all genres_X_Media library".film_id
join "all genres" on "all genres_X_Media library".genre_id = "all genres".genre_id
    where "all genres".genre_id =
          (
              select "all genres".genre_id
                from "all genres"
                where genre_nm = 'приключения'); -- средняя продолжительность фильмов в жанре приключения

-----------

select distinct first_nm, count(*)
    from actors
join "actors_X_media library" on actors.actor_id = "actors_X_media library".actor_id
join "media library" on "actors_X_media library".film_id = "media library".film_id
join "awards_X_media library" on "media library".film_id = "awards_X_media library".film_id
join awards on "awards_X_media library".award_id = awards.award_id
    where awards.award_id in (select awards.award_id from awards)
    group by first_nm; -- для каждого актёра количество фильмов, в которых он снимался, которые получили награду

-----------------------------------------------------

-- CRUD - select, insert, update, delete

select * from actors;
insert into actors (first_nm, second_nm, births_dt, height_amt, citizenship_txt) VALUES
    (
        'Екатерина',
        'Крупник',
        '14-09-2001',
        172,
        'Россия'
    );
update actors set height_amt = height_amt + 1
    where second_nm = 'Крупник';
delete from actors where second_nm = 'Крупник'

--

select * from awards;
insert into  awards (award_nm, info_dscr, foundation_dt) VALUES
    (
     'Отл10',
     'Самое высокое поощрение',
     '19-05-2021'
    );
update awards set award_nm = 'Отл11'
    where foundation_dt = '19-05-2021';
delete from awards where foundation_dt = '19-05-2021';


-----------------------------------------------------

create or replace view awards_vw as
    select award_nm, extract(years  from foundation_dt)
    from medialibrary.awards;

drop view awards_vw;

select *
    from awards_vw;

---

create or replace view "medialibrary_vw" as
    select film_nm, film_type, mpaa_rating_txt
    from medialibrary."media library";

select *
    from "medialibrary_vw";

---

create or replace view "additional info_vw" as
    select info_desc, country_nm, duration_min
    from medialibrary."additional info";

select *
    from "additional info_vw";

---

create or replace view actors_vw as
    select first_nm, second_nm
    from medialibrary.actors;

select *
    from actors_vw;

---

create or replace view "all genres_vw" as
    select genre_nm, info_dscr
    from medialibrary."all genres";

select *
    from "all genres_vw"

-------------------------------------------

create or replace view "additional more_vw" as
    select "media library".film_nm, "media library".film_type, substr(info_desc, 0, 20) || '...', country_nm, duration_min
    from medialibrary."additional info"
join medialibrary."media library" on "additional info".film_id = "media library".film_id;

drop view "additional more_vw";

select *
    from "additional more_vw";


----


create or replace view "awards more_vw" as
    select awards.award_nm, "media library".film_nm, "media library".IMDb_rating_rate, awarded_dt
        from "awards_X_media library"
    join "media library" on "awards_X_media library".film_id = "media library".film_id
    join awards on "awards_X_media library".award_id = awards.award_id
        order by IMDb_rating_rate;

select *
    from "awards more_vw";

