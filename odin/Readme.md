## Создание серверной базы:

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '
{
    "uuid": "94f8e2d6-8033-4c04-8391-1ba10a36a439",
    "name": "testdb",
    "descr": "",
    "dbms": "PostgreSQL",
    "db_server": "onec-server-kubeonec-postgres-service",
    "db_name": "testdb",
    "db_user": "postgres",
    "db_pwd": "",
    "security_level": 0,
    "license_distribution": 0,
    "scheduled_jobs_deny": false,
    "sessions_deny": false,
    "denied_from": "0001-01-01T00:00:00Z",
    "denied_message": "",
    "denied_parameter": "",
    "denied_to": "0001-01-01T00:00:00Z",
    "permission_code": "",
    "external_session_manager_connection_string": "",
    "external_session_manager_required": false,
    "security_profile_name": "",
    "safe_mode_security_profile_name": "",
    "reserve_working_processes": false,
    "date_offset": 0,
    "locale": "RU_ru"
  }' \
http://localhost:3001/api/v1/app/onec/infobases?create-db=true

```