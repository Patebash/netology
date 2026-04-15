# Домашнее задание к занятию 3 «Использование Ansible»

## Ansible Playbook: Установка Clikhouse, Vector, Lighthouse

### Описание

Playbook разворачивает стек для сбора и анализа логов:

- ClickHouse — хранение данных
- Vector — сбор логов
- Nginx — веб-сервер
- Lighthouse — интерфейс к ClickHouse

Playbook автоматически разворачивает стек для работы с логами. Устанавливает и настраивает ClickHouse для хранения данных, Vector для сбора логов, а также Nginx и Lighthouse для их просмотра через веб-интерфейс.
В процессе он устанавливает пакеты, применяет конфигурации, создаёт базу и таблицу и запускает все сервисы.

---

### Playbook применяется к хостам:

```yaml
clickhouse
vector
lighthouse
```

### Привилегии

**Все задачи выполняются с повышенными правами (sudo).**

```yaml
become: true
```

### Переменные

Playbook использует переменные описанные в [group_vars](./playbook/group_vars/)

### Структура playbook

#### ClickHouse

- Скачивает и устанавливает RPM пакеты
- fallback при ошибке загрузки
- Настраивает конфиг
- Перезапускает сервис
- Создаёт БД и таблицу
- Добавляет пользователя для Vector

#### Vector

- Скачивает .deb
- Устанавливает пакет
- Разворачивает конфиг
- Перезапускает сервис
- Создаёт /tmp/vector_test.log

#### Nginx

- Устанавливает nginx
- Применяет конфиг
- Restart / reload

#### Lighthouse

- Устанавливает git
- Клонирует репозиторий
- Настраивает nginx

### Пример запуска

```yaml
ansible-playbook -i inventory/prod.yml site.yml
```

### Требования

- Ansible 2.9+
- SSH-доступ к хостам
- Доступ в интернет для загрузки пакетов

### Templates

#### Vector:

- templates/vector/vector.conf.j2

#### ClickHouse:

- templates/clickhouse/listen.xml.j2
- templates/clickhouse/vector.xml.j2

#### Lighthouse:

- templates/lighthouse/nginx.conf.j2
- templates/lighthouse/lighthouse.conf.j2

### Результат выполнения

#### После успешного выполнения:

- ClickHouse установлен и запущен
- Создана база данных logs
- Создана таблица для логов
- Vector установлен и собирает логи
- Nginx установлен и работает
- Lighthouse доступен через веб-интерфейс
- Все сервисы добавлены в автозагрузку
