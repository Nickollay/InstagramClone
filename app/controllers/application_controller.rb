class ApplicationController < ActionController::Base
  # include Devise::Controllers::Helpers
  # protect_from_forgery with: :exception
  #
  # def after_sign_in_path_for(user)
  #   user_posts_path(user)
  # end
  # before_action :configure_permitted_parameters
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def load_user
    @user ||= params[:user_id].present? ? User.find(params[:user_id]) : current_user
  end

  # def load_user
  #   @user = User.find(params[:user_id])
  # end
end
