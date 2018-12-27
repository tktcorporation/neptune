class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order(boosted: :desc)
  end

end