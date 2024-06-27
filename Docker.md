Технологии виртуализации и контейнеризации

docker host - компьютер или виртуальные сервер с установленным Docker

docker daemon - программа для исполнения докер-контейнеров. Докер-демон запускает контейнеры, предоставляет им необходимые ресурсы и контролирует их работу

docker client - программа, передающая команды пользователя докер-демону. Клиент может быть консольным или графическим

Докер-образ - это шаблон, из которого создаются Docker-контейнеры. Образ хранит в себе всё необходимое для запуска приложения: код приложения, среду выполнения, библиотеки, *переменные окружения*, конфигурационные файлы.


## Команды для докера

Запустить контейнер с именем hello-container из образа hello-world
```bash
docker run --name hello-container hello-world
```

`docker` - вызов докер-клиента.
`run` - команда для докер контейнера "Запусти контейнер"
`--name hello-container` - параметр для команды run: присвой запущенному контейнеру имя _hello-container_
`hello-world` — имя образа (image), шаблона из которого запускают контейнер

Удалить контейнер с указанным ID
```
sudo docker container remove 69c418949779
```

Остановить контейнер с указанным именем или ID
```
sudo docker container stop nginx-container
```

показать список контейнеров (всех)
```
sudo docker container ls -a
```

Запустить контейнер с веб-сервером nginx на порту 8001 сервера и порту 80 контейнера
```
sudo docker run -p 8001:80 --name nginx-container nginx
```

Показать список образов, которые находятся локально на устройстве
```bash
sudo docker image ls -a
```

Удалить образ (получится только если не существует контейнера созданного из этого образа):
```
sudo docker image rm d2c94e258dcb
```

Запустить терминал внутри контейнера в интерактивном режиме
```
sudo docker exec -it nginx-container bash
```

Запустить команду touch внутри контейнера и создать файл index.html не переходя внутрь операционной системы контейнера
```
sudo docker exec nginx-container touch index.html
```


```
sudo docker run --name local-database --rm postgres
```

```
sudo docker run --name local-database --rm -e POSTGRES_PASSWORD=testpass -e POSTGRES_USER=testuser postgres
```

```
sudo docker exec -it local-database psql -U testuser
```