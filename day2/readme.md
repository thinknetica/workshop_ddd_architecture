# Domain Driven Design в Ruby приложениях

## День 2. Использование DDD для Rails-приложений

2.1. [Поддомены](https://app.holst.so/share/b/2afa9779-77cc-407e-bc81-e9db0f7af740)

2.2. [Пользовательские истории](https://app.holst.so/share/b/439e26d3-3ad1-4fb4-8f15-af17b0feac85)

2.3. [Archimate: Бизнес-процесс привлечения лидов](leads.archimate)

2.4. [Элементы Archimate в Holst](https://app.holst.so/share/b/e1bf0319-6193-4c6f-b28f-9a8b7836354f)

2.5. Генерация приложения при помощи гема [nextgen](https://github.com/mattbrictson/nextgen)

```
gem exec nextgen create cources
```

2.6. OpenAPI

Документирование REST-подхода.

Cсылки на документацию и инструменты:
- [OpenAPI](https://spec.openapis.org/oas/v3.1.0)
- [stoplight.io](https://stoplight.io/)
- [education.yaml](education.yaml)
- [swagger-editor](swagger-editor)
- [redoc](https://github.com/Redocly/redoc)
- [prism](https://github.com/stoplightio/prism)

2.7. AsyncAPI

Документирование Event-driven подхода.

Cсылки на документацию и инструменты:

- [Концепция AsyncAPI](https://www.asyncapi.com/docs/concepts/asyncapi-document)
- [Сравнение AsyncAPI и OpenAPI](https://www.asyncapi.com/docs/tutorials/getting-started/coming-from-openapi)
- [AsyncAPI Studio](https://studio.asyncapi.com/)
- [GitHub AsyncAPI Studio](https://github.com/asyncapi/studio/tree/master)
- [Документация по AsyncAPI](https://www.asyncapi.com/docs)
- [Работа с AsyncAPI Studio](https://deepwiki.com/asyncapi/studio/2.2-docker-deployment)
- [Целевая BPMN-диаграмма](https://app.holst.so/share/b/222537fe-10cf-45bc-80ca-2132aa5e3936)
- [homework.yml](homework.yml)

Запуск AsyncAPI Studio локально:

```
docker build -f apps/studio/Dockerfile -t asyncapi/studio .
docker run -p 8080:80 asyncapi/studio
```
