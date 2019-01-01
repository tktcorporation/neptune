class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.includes(:recipe_ingredients, :instructions).find(params[:id])
  end

  def update
    recipe = Recipe.includes(:recipe_ingredients, :instructions).find(params[:id])
    if recipe.update_with_relations(recipe_params, update_recipe_ingredients_params, recipe_ingredient_ids_params, update_instructions_params, instruction_ids_params)
      flash[:notice] = "レシピ内容を更新しました"
    else
      flash[:notice] = "レシピ内容の更新に失敗しました"
    end
    redirect_to admin_recipes_path
  end

  def create
    if Recipe.create_with_relations(recipe_params, create_recipe_ingredients_params, create_instructions_params)
      flash[:notice] = "レシピを作成しました"
    else
      flash[:notice] = "レシピの作成に失敗しました"
    end
    redirect_to admin_recipes_path
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    redirect_to admin_recipes_url
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :video_url, :thumbnail_url, :servings, :introduction, :publish)
    end
    def update_recipe_ingredients_params
      params.require(:recipe).permit(recipe_ingredient: [:name, :quantity_and_unit])[:recipe_ingredient]
      #.require(:recipe_ingredient)
    end
    def update_instructions_params
      params.require(:recipe).permit(instruction: :body)[:instruction]
    end
    def create_recipe_ingredients_params
      params.require(:recipe).permit(recipe_ingredient: [:name, :quantity_and_unit])
    end
    def create_instructions_params
      params.require(:recipe).permit(instruction: :body)
    end
    def recipe_ingredient_ids_params
      params.require(:recipe).require(:recipe_ingredient_ids).permit! if params[:recipe][:recipe_ingredient_ids].present?
    end
    def instruction_ids_params
      params.require(:recipe).require(:instruction_ids).permit! if params[:recipe][:instruction_ids].present?
    end
end