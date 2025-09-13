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

## Работаем со slim

Устанавливаем гем html2slim, добавляя его в Gemfile

```
gem "html2slim", git: "https://github.com/slim-template/html2slim.git"
```

Pапускаем утилиту

```
bundle exec erb2slim -d .
```

## Установка гема omniauth-github

Настройка ведется по [инструкции](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview). В ней приводится настройка через oauth фейсбука, мы будем настраивать через github, поэтому потребуется некоторая адаптация.

Создаем oauth-приложение lms в локальном keycloak.

Параметры `Client ID` и `Client secrets` помещаем в `.env` файл.
