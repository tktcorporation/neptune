class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.where(publish: true).order(boosted: :desc)
  end

  def show
    @recipe = Recipe.includes(:recipe_ingredients, :instructions).find_by(id: params[:id], publish: true)
    @salt_and_calorie = @recipe.get_salt_and_calorie_per_person
  end
end