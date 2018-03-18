class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q

  def set_q
	@q = Meeting.search(params[:q])
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :grade])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:grade,:password, :password_confirmation, :admin])
    end

    def after_sign_in_path_for(resource)
      tops_path
    end

  end
