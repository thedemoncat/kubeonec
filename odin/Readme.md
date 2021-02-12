## Создание серверной базы:

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '
{
    "name": "test",
    "descr": "",
    "dbms": "PostgreSQL",
    "db_server": "onec-server-kubeonec-postges-service",
    "db_name": "test",
    "db_user": "postgres",
    "db_pwd": ""
  }' \
http://localhost:3001/api/v1/app/onec/infobases?create-db=true

```