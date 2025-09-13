class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :github

  def github
    Rails.logger.info "########################################################################"
    Rails.logger.info "Внутри метода github"
    Rails.logger.info "########################################################################"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    Rails.logger.info "########################################################################"
    Rails.logger.info @user
    Rails.logger.info "########################################################################"
    Rails.logger.info request.env
    Rails.logger.info "########################################################################"

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
