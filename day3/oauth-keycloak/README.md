# Настройка проекта

## Цель

Проект oauth2-клиента, который использует с качестве oauth-сервера Keycloak.

## Генератор Rails-приложений

```
gem exec nextgen create oauth-keycloak
```

## Установка гема devise

В файле Gemfile подключаем devise

```
gem 'devise'
```

Развертываем установочные файлы

```
bundle exec rails generate devise:install
```

Пользователей создаем через гем Devise

```
bundle exec rails generate devise User
bundle exec rails db:migrate
```
