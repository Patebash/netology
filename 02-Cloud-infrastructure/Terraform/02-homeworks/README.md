# Домашнее задание к занятию «Основы Terraform. Yandex Cloud».


## Задание 1

### Условие ответа:

> Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть;

> скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;

> скриншот консоли, curl должен отобразить тот же внешний ip-адрес;

> ответы на вопросы.

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


> Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.


#### Прерываемая ВМ и выделенная доля CPU в процессе обучения пригодятся для акономии выделенного гранта на весь срок обучения. Маленькая доля CPU ниже стоимость VM. Забыл удалить VM, прерываемая VM остановится автоматически через 24 часа.

---

