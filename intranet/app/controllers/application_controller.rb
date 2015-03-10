class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :configure_devise_params, if: :devise_controller?
  before_filter :check_for_authentification, :except => :sign_out

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :surname,  :email, :password, :password_confirmation)
    end
  end

  def check_for_authentification
  	if current_user && current_user.is_guest? && !(params[:action] == "guest")
  		redirect_to guest_wait_path, notice: "You are guest, wait your activation!"
  	end
  end

end
