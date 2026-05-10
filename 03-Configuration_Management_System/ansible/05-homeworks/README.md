## Домашнее задание к занятию 5 «Тестирование roles»

### Установленные версии ПО:

* ansible-core 2.20.4
* molecule 26.3.0
* molecule-podman 2.0.3
* molecule-docker 2.1.0
* ansible-lint 26.3.0

### Molecule

1. Команда выдала ошибку по причине разности версий molecule. Структура molecule.yml в роли clickhouse устарела.

![](images/task.png)

2. Изменился синтаксис команды в новых версиях molecule:

![](images/task1.png)

3-5. В роли используется systemd, поэтому для тестирования были использованы следующие образы:

```
geerlingguy/docker-debian12-ansible:latest
geerlingguy/docker-fedora43-ansible:latest
```

#### Destroy

![](images/task2.png)

#### Create

![](images/task3.png)

#### Converge

![](images/task4.png)

#### Converge-idempotence

![](images/task5.png)

#### Verify

![](images/task6.png)

#### Destroy

![](images/task7.png)

6. Ссылка на версию [vector-role](https://github.com/Patebash/vector-role/tree/v1.1.0) с ценарием docker.

### Tox

1-6. При первом запускей tox завершился ошибками из-за конфликта зависимостей. 
Сборка **py37-ansible28** падает, потому что **Python 3.7** уже не поддерживается современными версиями Ansible (начиная с 2.12+). Предупреждение **CryptographyDeprecationWarning** указывает на использование устаревшего Python и зависимостей, которые больше не поддерживаются. Дополнительно, устаревшая версия ansible-galaxy приводит к ошибкам при установке зависимостей из-за несовместимости API.

Отредактировал tox.ini, прописал зависимости определенных версий пакетов.

![](images/task8.png)

Так как вывод достаточно большой, приложил скрины одно из сценария, а именно **py39-ansible28**:

![](images/task9.png)
![](images/task10.png)
![](images/task11.png)

Так же прикладываю итоговый результат выполнения тестирования:

![](images/task12.png)

7. Ссылка на версию [vector-role](https://github.com/Patebash/vector-role/tree/v1.2.0) с ценарием podman.
