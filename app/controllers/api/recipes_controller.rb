class Api::RecipesController < ApplicationController
  before_action :set_current_user

  def index
    if @user
      @recipes = Recipe.get_according_to_conditions(@user)
    else
      render json: {status: 401, message: 'Invalid'}
    end
  end

  def show
    if @user
      @recipe = Recipe.includes(:recipe_ingredients, :instructions).find_by(id: params[:id], publish: true)
      @salt_and_calorie = @recipe.get_salt_and_calorie_per_person
    else
      render json: {status: 401, message: 'Invalid'}
    end
  end
  private
    def set_current_user
      @user = User.auth_with_token(params[:token])
    end
end