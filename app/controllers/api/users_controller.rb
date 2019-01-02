class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    if User.find_by(email: user_params[:email]).present?
      return render json: {status: 401, message: 'すでに存在しているユーザーです'}
    end
    user = User.new(user_params)
    if user.save
      render json: {status: 200, message: "Success"}
    else
      render json: {status: 401, message: "Fail"}
    end
  end

  def get_auth_token
    current_user = User.find_by(email: user_params[:email])
    if current_user&&current_user.authenticate(user_params[:password])
      current_user.refresh_token
      render json: {status: 200, message: 'Success', token: current_user.auth_token}
    else
      render json: {status: 401, message: 'Invalid'}
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end