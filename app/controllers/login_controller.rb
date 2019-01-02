class LoginController < ApplicationController
  def new
    @user = User.new
  end

end
