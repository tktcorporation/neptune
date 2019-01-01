class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.where(publish: true).order(boosted: :desc)
  end

  def show
    @recipe = Recipe.includes(:recipe_ingredients, :instructions).find_by(id: params[:id], publish: true)
  end
end