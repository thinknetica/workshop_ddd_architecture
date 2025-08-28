# Domain Driven Design в Ruby приложениях

## День 2. Использование DDD для Rails-приложений

2.1. [Поддомены](https://app.holst.so/share/b/2afa9779-77cc-407e-bc81-e9db0f7af740)

2.2. [Пользовательские истории](https://app.holst.so/share/b/439e26d3-3ad1-4fb4-8f15-af17b0feac85)

2.3. [Archimate: Бизнес-процесс привлечения лидов](leads.archimate)

2.4. Генерация приложения при помощи гема [nextgen](https://github.com/mattbrictson/nextgen)

```
gem exec nextgen create cources
```

2.5. OpenAPI

Документирование REST-подхода.

Cсылки на документацию и инструменты:
- [OpenAPI](https://spec.openapis.org/oas/v3.1.0)
- [stoplight.io](https://stoplight.io/)
- [education.yaml](education.yaml)
- [swagger-editor](swagger-editor)
- [redoc](https://github.com/Redocly/redoc)
- [prism](https://github.com/stoplightio/prism)

2.6. AsyncAPI

Документирование Event-driven подхода.

Cсылки на документацию и инструменты:

- [Концепция AsyncAPI](https://www.asyncapi.com/docs/concepts/asyncapi-document)
- [Сравнение AsyncAPI и OpenAPI](https://www.asyncapi.com/docs/tutorials/getting-started/coming-from-openapi)
- [AsyncAPI Studio](https://studio.asyncapi.com/)
- [Документация по AsyncAPI](https://www.asyncapi.com/docs)
- [Работа с AsyncAPI Studio](https://deepwiki.com/asyncapi/studio/2.2-docker-deployment)

Запуск AsyncAPI Studio локально:

```
docker build -f apps/studio/Dockerfile -t asyncapi/studio .
docker run -p 8080:80 asyncapi/studio
```
