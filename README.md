# Kubeonec

# Запуск сервера 1С:Предприятия в кластере kubernates

## Важно: 

Запуск сервера 1С:Предприятие в кластере kubernates официально не поддерживается вендером, по этому все что мы делаем является экспериментальными проектами и не подходят в работе по продуктивном окружении. Использование данного проекта целиком и полностью на вашей ответственности и разработчик не несет никакой ответственности за какие либо проблемы или потерю данных.  

Документация пока носит пока служебный формат и пока по факту является моими набросками для запуска и отладки. В дальнейшем будет приведена в нормальное состояние.

## Запуск кластера


1. При использовании приватного docker registry необходимо создать секрет, с указанием параметров авторизации.

```
kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>

```
, где 

`<your-registry-server>` Адрес приватного Docker Registry FQDN. (https://index.docker.io/v1/ для DockerHub)
`<your-name>`  Пользователь Docker.
`<your-pword>` Пароль Docker.
`<your-email>` Электронная почта пользователя Docker.

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


## Сборка образов 1С

1. Для отправки образа в удаленное docker registry необходимо создать файл `config.json` и смонтировать его в нужное место.
Если уже было выполнено создание секрета `regcred`, то он и монтируется. 


2. Создаем конфигурационный файл `.env` с параметрами авторизации на площадке 1С

```
    ONEC_USERNAME=<ПОЛЬЗОВАТЕЛЬ_USERS.1C.V8.RU>

    ONEC_PASSWORD=<ПАРОЛЬ_ОТ_USERS.1C.V8.RU>
    
    ONEC_VERSION=8.3.14.1993

```
3. Создаем секрет с параметрами авторизации на площадке 1С

```
kubectl create secret generic user-onec --from-env-file=.env
```

4. Запускаем задачу сборки образа

```
kubectl apply -f stuffing/job.yaml
```