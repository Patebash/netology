# Домашнее задание к занятию «Как работает сеть в K8s»

## Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа
> 1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы;
> 2. В качестве образа использовать network-multitool;
> 3. Разместить поды в namespace App;
> 4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены;
> 5. Продемонстрировать, что трафик разрешён и запрещён.

## Ответ:

*1,2,3 Создал deployment'ы, services и расположил их в namespace app.*

![image](images/task1.png)

[deployment](manifests/deployments)

[services](manifests/services)

*4 Создал политику по умолчанию запрещающий весь трафик в namespace app. Так же создал необходимые разрешающие политики*

![image](images/task2.png)

[NetworkPolicy](manifests/networkpolicy)

*5 Проверка доступа:*

**Из frontend:**

![image](images/task3.png)

```
frontend ───► backend    ✅

frontend ───► cache      ❌
```
**Из backend:**

![image](images/task4.png)

```
backend ───► cache       ✅

backend ───► frontend    ❌
```

**Из cache:**

![image](images/task5.png)

```
cache ───► frontend   ❌

cache ───► backend    ❌
```
