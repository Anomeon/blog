class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    registration_params = [:email, :password,
                           :password_confirmation, :first_name,
                           :second_name, :patronymic, :gender, :birthday]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
          |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
          |u| u.permit(registration_params)
      }
    end
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to root_url,
                  alert: "Please, Sign In first!"
    end
  end

  def all_tags
    @tags = Tag.all
  end 

end
