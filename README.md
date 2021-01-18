# Kubeonec

# Запуск сервера 1С:Предприятия в кластере kubernates

## Важно: 

Запуск сервера 1С:Предприятие в кластере kubernates официально не поддерживается вендером, по этому все что мы делаем является экспериментальными проектами и не подходят в работе по продуктивном окружении. Использование данного проекта целиком и полностью на вашей ответственности и разработчик не несет никакой ответственности за какие либо проблемы или потерю данных.  

## Запуск кластера

`Документация пока носит пока служебный формат и пока по факту является моими набросками для запуска и отладки. В дальнейшем будет приведена в нормальное состояние.`

1. При использовании приватного docker registry необходимо создать секрет, с указанием параметров авторизации.

```
kubectl create secret docker-registry regsecret --docker-server=$DOCKER_REGISTRY_URL --docker-username=$USERNAME --docker-password=$PASSWORD --docker-email=$EMAIL

```
, где `regsecret` - имя секрета.

Затем прописать этот секрет в файле переменных values.yaml в блоке:

```
imagePullSecrets: [
    "regsecret"
]
```

2. Создаем новый namespace

```
kubectl create ns onec
```
3. устанавливаем инстанс из чарта

```
    helm upgrade -i  onec-server -n onec -f D:\repo\DemonCat\kubeonec\charts\kubeonec\values.yaml  D:\repo\DemonCat\kubeonec\charts\kubeonec
```


