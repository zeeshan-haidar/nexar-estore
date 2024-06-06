module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_out_all_scopes
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_path
      end
    end

    def google_oauth2
      user = User.from_omniauth(request.env['omniauth.auth'])
      if user.present?
        sign_out_all_scopes
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{request.env['omniauth.auth']['info']['email']} is not authorized."
        redirect_to new_user_registration_path
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
