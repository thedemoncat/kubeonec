# Kubeonec

Запуск сервера 1С:Предприятия в кластере kubernates

1. Создаем новый namespace


```
kubectl create ns onec
```
2. устанавливаем инстанс из чарта

```
    helm install onec -n onec -f D:\repo\DemonCat\kubeonec\charts\kubeonec\values.yaml  D:\repo\DemonCat\kubeonec\charts\kubeonec
```