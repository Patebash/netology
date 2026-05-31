## Домашнее задание к занятию 11 «Teamcity»

### Подготовка к выполнению

1. Создать/развернуть VM для работы с TeamCity и Nexus

![](images/task1.png)

---

### Скриншоты и шаги выполнения

1-7 пункты. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus:

![](images/build.png)
![](images/nexus.png)

8 пункт. Мигрируйте build configuration в репозиторий:

![](images/migration.png)

Ссылка на сборку [build configuration](https://github.com/Patebash/example-teamcity/tree/master/.teamcity)

9-19 пункты. Создана отдельная ветка, добавлен новый метод в класс Welkomer, выполнен merge в master.

*Проведена контрольная сборка проекта:*

![](images/finished_build.png)

*Собирается .jar в артефакты сборки:*

![](images/artifacts.png)

Ссылка на репозиторий проекта [project](https://github.com/Patebash/example-teamcity)
