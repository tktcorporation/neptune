class Api::RecipesController < ApplicationController

  def index
    user = User.auth_with_token(params[:token])
    if user
      #ユーザー認証を行って、ユーザーがday0のときだけ「order(boosted: :desc)」とする？
      @recipes = Recipe.where(publish: true).order(boosted: :desc)
    else
      render json: {status: 401, message: 'Invalid'}
    end
  end

  def show
    user = User.auth_with_token(params[:token])
    if user
      @recipe = Recipe.includes(:recipe_ingredients, :instructions).find_by(id: params[:id], publish: true)
      @salt_and_calorie = @recipe.get_salt_and_calorie_per_person
    else
      render json: {status: 401, message: 'Invalid'}
    end
  end
end