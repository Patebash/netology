# Домашнее задание к занятию «Сетевое взаимодействие в Kubernetes»

## Задание 1: Настройка Service (ClusterIP и NodePort)
> 1. Создать Deployment с двумя контейнерами;
> 2. Создать Service типа ClusterIP;
> 3. Проверить доступность изнутри кластера;
> 4. Создать Service типа NodePort для доступа к nginx снаружи;
> 5. Проверить доступ с локального компьютера.


## Ответ:

**1. Создать Deployment с двумя контейнерами**

![image](images/task1.png)

[deployment-multi-container.yaml](manifests/deployments/deployment-multi-container.yaml)

**2,3. Создать Service типа ClusterIP и Проверить доступность изнутри кластера**

![image](images/task2.png)

[service-clusterip.yaml](manifests/services/service-clusterip.yaml)

**4,5. Создать Service типа NodePort для доступа к nginx снаружи и Проверить доступ с локального компьютера.**

![image](images/task3.png)

[service-nodeport.yaml](manifests/services/service-nodeport.yaml)
