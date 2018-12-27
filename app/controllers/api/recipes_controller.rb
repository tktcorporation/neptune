class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order(boosted: :desc)
  end

  def show
    @recipe = Recipe.includes(:recipe_ingredients, :instructions).find(params[:id])
  end
end