# Используем стандартный легковесный образ python последней версии - 3.9.16-alpine3.17
FROM python:3.9.16-alpine3.17

# Обновляем кэш и ставим нужные пакеты для работы python и базы данных
RUN yum install libpq-devel.x86_64 gcc -y && pip install Flask Psycopg2 ConfigParser

# Контейнер слушает указанный ниже порт
EXPOSE 80

# Cоздает точку монтирования с заданным именем и помечает его как внешний смонтированный том из базового хоста
VOLUME ["/srv/app/", "/srv/app/conf/"]

# Запускает скрипт python их примонтированной папки хоста
ENTRYPOINT ["python3", "/srv/app/web.py"]
