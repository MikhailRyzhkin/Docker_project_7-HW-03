# Используем стандартный легковесный образ python последней версии - 3.9.16-alpine3.17
FROM python:3.9.16-alpine3.17

# Обновляем кэш и ставим нужные пакеты для работы python и базы данных, удаляем кэш
RUN /usr/local/bin/python -m pip install --upgrade pip && apk update && apk add --no-cache --virtual .gyp python3 make g++ && pip install Flask psycopg2-binary ConfigParser && mkdir /srv/app/ && rm -rf /var/tmp/* /var/cache/*

WORKDIR /srv/app/

# Запускает скрипт python из примонтированной папки хоста
ENTRYPOINT python /srv/app/web.py
