class ApplicationController < ActionController::Base
  # include Devise::Controllers::Helpers
  # protect_from_forgery with: :exception
  #
  # def after_sign_in_path_for(user)
  #   user_posts_path(user)
  # end

  private

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
