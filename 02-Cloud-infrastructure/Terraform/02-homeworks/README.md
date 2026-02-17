# Домашнее задание к занятию «Основы Terraform. Yandex Cloud».


## Задание 1

### Условие ответа:

> Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

### Ответ:

![YC](images/task1.png)

![VM](images/task1.1.png)

```
│ error: code = FailedPrecondition desc = Platform "standart-v4" not found
│
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
```
#### Неверно указан id платформы, исправил на standard-v3 согласно инструкции https://yandex.cloud/ru/docs/compute/concepts/vm-platforms

```
│ error: code = InvalidArgument desc = the specified core fraction is not available on platform "standard-v3"; allowed core fractions: 20, 50, 100
│
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
```
#### Неверно указан аргумент для core_fraction = 5, а допустимые значения гарантированной доли CPU для данной платформы 20, 50, 100. исправил на 20.

---
