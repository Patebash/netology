# Домашнее задание к занятию 2 «Работа с Playbook»

## Ansible Playbook: Установка Clikhouse и Vector

### Описание

Данный playbook предназначен для автоматической установки и настройки:

- **ClickHouse** — колоночной СУБД для аналитики
- **Vector** — агента для сбора и доставки логов

Playbook выполняет:
- загрузку и установку пакетов ClickHouse
- запуск сервиса ClickHouse
- создание базы данных `logs`
- установку и настройку Vector
- создание systemd-сервиса для Vector
- запуск и включение Vector в автозагрузку

---

### Playbook применяется к группе хостов clickhouse

```yaml
hosts: clickhouse
```
### Привилегии

**Все задачи выполняются с повышенными правами (sudo).**

```yaml
become: true
```

### Переменные

Playbook использует переменные описанные в [group_vars](./playbook/group_vars/clickhouse/vars.yml)

### Структура playbook

#### 1. Установка ClickHouse

 - Загружает RPM-пакеты ClickHouse
 - При ошибке загрузки использует fallback (common-static)
 - Устанавливает пакеты:
    - clickhouse-common-static
    - clickhouse-client
    - clickhouse-server
 - Перезапускает сервис ClickHouse
 - Создаёт базу данных logs

#### 2. Установка Vector

 - Создаёт системного пользователя
 - Создаёт директории установки
 - Распаковывает архив Vector
 - Разворачивает конфигурацию из шаблона
 - Создаёт systemd unit-файл
 - Перезапускает и включает сервис

### Пример запуска

```yaml
ansible-playbook -i inventory/prod.yml site.yml
```

### Требования

- Ansible 2.9+
- Доступ к хостам по SSH
- Наличие файла:

```
/tmp/vector-{{ vector_version }}.tar.gz
```
- Наличие шаблона:

```
templates/vector.yml.j2
```
### Результат выполнения
После выполнения playbook:
  - ClickHouse установлен и запущен
  - Создана база данных logs
  - Vector установлен и работает как systemd-сервис
  - Vector автоматически запускается при старте системы
