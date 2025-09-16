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
gem 'slim-rails'
gem 'html2slim', git: 'https://github.com/slim-template/html2slim.git'
```

Pапускаем утилиту

```
bundle exec erb2slim -d .
```

## Установка гема omniauth-keycloak

Настройка ведется по [инструкции](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview). В ней приводится настройка через oauth фейсбука, мы будем настраивать через github, поэтому потребуется некоторая адаптация.

Создаем oauth-приложение lms в локальном keycloak.

Параметры `Client ID` и `Client secrets` помещаем в `.env` файл.

Далее подключаем гем omniauth-keycloak

```
gem 'omniauth-keycloak'
gem 'omniauth-rails_csrf_protection'
```

Добавляем параметры для дополнительных полей в таблице users

```
bundle exec rails g migration AddOmniauthToUsers provider:string uid:string
bundle exec rails db:migrate
```

В config/initializers/devise.rb добавляем строку

```
config.omniauth :keycloak_openid, "lms", "", client_options: { site: "http://localhost:8080", realm: "education" }, strategy_class: OmniAuth::Strategies::KeycloakOpenId
```

В модель `User` добавляем модуль `:omniauthable`

```
class User < ApplicationRecord
  #...
  devise :omniauthable, omniauth_providers: %i[keycloakopenid]
  #...
end
```

Выполнив команду `bundle exec rails routes` можно убедиться, что добавлено два новых роута

```
user_keycloakopenid_omniauth_authorize /users/auth/keycloakopenid
user_keycloakopenid_omniauth_callback  /users/auth/keycloakopenid/callbac
```

Первый предназначен для обращения со страниц сайта, второй дергает Keycloak после успешной аутентификации пользователей.

Для реализации callback-а добавляем в config/routes.rb строку (точнее модифицируем ранее добавленную)

```
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
```

В app/controllers/users/omniauth_callbacks_controller.rb реализуем логику обработки callback-вызова

```
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :keycloakopenid

  def keycloakopenid
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Keycloak") if is_navigational_format?
    else
      session["devise.keycloak_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end

```

Расширяем модель User методами `from_omniauth` и `new_with_session`:

```ruby
class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :omniauthable, omniauth_providers: %i[keycloakopenid]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
```

Реализуем вход на главной странице app/views/home/index.html.slim

```
- unless user_signed_in?
  = button_to "Sign in with Keycloak", user_keycloakopenid_omniauth_authorize_path, data: { turbo: false }
- else
  = current_user.inspect
```
