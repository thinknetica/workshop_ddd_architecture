## Запуск в docker-контейнере

Запуск приложения с базой данных в docker

```bash
docker compose up
```

Запуск с пересборкой образов

```bash
docker compose up --build
```

## Запуск keycloack

Проект можно обнаружить по ссылке: http://localhost:8080/

## Подготовка среды

### Создание realm, пользователя, группы и роли

1. Входим в административную панель с логином и паролем admin:admin
2. Создаем realm с названием education
3. Создаем пользователя lms с электронной почтой lms@lms.to, отмечая ее верифицированной
4. На детальной странице пользователя в разделе Credentials задаем пароль lms (сразу снимаем галку, что он временный)
5. Создаем группу experts и добавляем в нее пользователя lms
6. Создаем роль experts и добавляем в нее пользователя lms

### Создание клиента

1. Создаем клиента с ClientID: lms
2. В качестве Client Type выбираем OpenID Connect
3. Чекбокс Always display in UI оставляем выключенным (если только не нужно каждый раз показывать keycloak-форму)
4. В качестве Authentication flow оставляем по умолчанию Standard flow
5. Выставляем Root URL, Home URL и Valid redirect URIs в http://localhost:8000/.
6. Выставляем в поле Valid post logout redirect URIs символ +
7. Выставляем в поле Web origins символ +, чтобы предотвратить ошибки с CORS-заголовками

### Примеры на JavaScript

В папке javascript имеются отладочные javascript-приложения для тестирования входа через OAuth2

Запускаем backend

```
docker build -t backend .
docker run -p 3000:3000 backend
```

Запускаем frontend

```
docker build -t frontend .
docker run -p 8000:8000 frontend
```