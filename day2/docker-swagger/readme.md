## Запуск в docker-контейнере

Запуск приложения с базой данных в docker

```bash
docker compose up
```

Запуск с пересборкой образов

```bash
docker compose up --build
```

## Запуск swagger-editor

Проект можно обнаружить по ссылке: http://localhost:3333/

## Запуск mock-сервера

Запуск mock-сервера (prism) с OpenAPI-описанием в файле api.yaml

```
docker run --init --rm -v /Users/igorsimdanov/Downloads:/tmp \
-p 4010:4010 stoplight/prism:4 mock -h 0.0.0.0 "/tmp/api.yaml"
```
