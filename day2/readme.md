# Domain Driven Design в Ruby приложениях

## День 2. Использование DDD для Rails-приложений

2.1. [Поддомены](https://app.holst.so/share/b/2afa9779-77cc-407e-bc81-e9db0f7af740)

2.2. [Пользовательские истории](https://app.holst.so/share/b/439e26d3-3ad1-4fb4-8f15-af17b0feac85)

2.3. [Archimate: Бизнес-процесс привлечения лидов](leads.archimate)

2.4. Генерация приложения при помощи гема [nextgen](https://github.com/mattbrictson/nextgen)

```
gem exec nextgen create oauth-github
```

2.5. OpenAPI

TODO добавить ссылки на документацию и инструменты
stoplight.io
swagger-editor
[redoc](https://github.com/Redocly/redoc)
prism

TODO-план:
- OpenAPI
- AsyncAPI

Инструменты:

https://studio.asyncapi.com/

https://deepwiki.com/asyncapi/studio/2.2-docker-deployment
docker build -f apps/studio/Dockerfile -t asyncapi/studio .
docker run -p 8080:80 asyncapi/studio
