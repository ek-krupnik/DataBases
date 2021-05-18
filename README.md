# Проектирование базы данных в рамках курса МФТИ

## Тема: Сервис поиска и просмотра фильмов и сериалов.
Проектирование базы данных фильмов и сериалов (медиатека, на основе Кинопоиска).

_Сущности:_

1 - **Медиатека** (хранит фильмы, сериалы, ту информацию о них, что будет показываться в виде превью)

2 - **Дополнительная информация о фильмах** (необходима при более детальном изучении фильма)

3 - **Каст фильма** (хранит в себе связи актер - фильм)

4 - **Актеры** (список всех возможных с дополнительной информацией)

5 - **Жанр фильма** (связи фильм - жанр)

6 - **Все возможные жанры**

7 - **Награды** (премии, фестивали и т.д.)

### _1) Концептуальная модель базы данных:_
![alt text](https://psv4.userapi.com/c534536/u156955827/docs/d28/b3d17a2ad20c/bd1.jpg?extra=yTK1lQgPMChfoR5FQ6_D_GqoYCRFauskCwNvC1j0mxmAKslRZCCfampqASpVuJnb7DKASPWU_EzsqDSj_fIvfBKjNEH0cafSa_vdy1g6-nH7ZyOl8EH5DeZvaLc82BYacyZMbn13Qc9ElZWxl0WV2w)

### _2) Логическая модель базы данных:_
![alt_text](https://sun1-93.userapi.com/impg/dpMUjutkoURatOrZiYiHO0jLMhC0FpgAQoWivw/T8Xg96k6Ex4.jpg?size=1550x841&quality=96&sign=7bba219ed76973f45ca7e8c71fd329cd&type=album)

### _3) Физическая модель базы данных:_
![alt_text](https://sun9-34.userapi.com/impg/rXZuDiu3dg1SVfbZMVz1da6xSynwNr5UVMPjQw/jYkw4M9HYkA.jpg?size=1036x910&quality=96&sign=9f866702682c118e4932d2a3d5d4cd7f&type=album)
![alt_text](https://sun9-27.userapi.com/impg/w9SVe1R7dKXA_fL1GH9DVR_K8ZDcdyjgJnVE9A/GmtGeiwkgc0.jpg?size=1036x788&quality=96&sign=ea97a2c05016e29a2b3aec96ef34b42a&type=album)
![alt_text](https://sun9-38.userapi.com/impg/QzNYLdOAf-5gmBZstJibf7t9ZL3TTb_up9RZYg/FNpB7UJONPI.jpg?size=1049x655&quality=96&sign=4e9b4c22796e9dcebcca1257f17421cf&type=album)
