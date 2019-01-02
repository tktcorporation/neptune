class CookiesController < ApplicationController
  def create
    current_user = User.find_by(email: user_params[:email])
    if current_user&&current_user.authenticate(user_params[:password])
      current_user.refresh_token
      cookies[:auth_token] = { :value => current_user.auth_token, :expires => 1.hour.from_now }#, :secure => true }
      redirect_to recipes_url
    else
      redirect_to login_url
    end
  end
  def delete
    cookies.delete :auth_token
  end
  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end