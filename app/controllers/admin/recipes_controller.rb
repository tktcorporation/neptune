class Admin::RecipesController < ApplicationController
  def index
  end

  def edit
    @recipe = Recipe.includes(:recipe_ingredients, :instructions).find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :video_url, :thumbnail_url, :description, :notify)
    end
end