#!/bin/bash

# Загружаем переменные
set -o allexport
source /opt/.env
set +o allexport

mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')

docker run --rm \
  --network shvirtd-example-python_backend \
  --entrypoint mysqldump \
  -v "$BACKUP_DIR":/backup \
  schnitzler/mysqldump \
  --no-tablespaces \
  -h "$MYSQL_HOST" \
  -u "$MYSQL_USER" \
  -p"$MYSQL_PASSWORD" \
  "$MYSQL_DATABASE" \
  > "$BACKUP_DIR/${MYSQL_DATABASE}_$TIMESTAMP.sql"

if [ $? -eq 0 ]; then
    echo "Дамп создан: $BACKUP_DIR/${MYSQL_DATABASE}_$TIMESTAMP.sql"
else
    echo "Ошибка при создании дампа!"
fi

# Очистка старых дампов старше 7 дней
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -delete
