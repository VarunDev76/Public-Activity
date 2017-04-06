class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @allRecipe = @user.recipes.all
  end

  def show
    @user = User.find(params[:user_id])
    @recipe =  Recipe.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
        redirect_to user_recipes_path(@user,@recipe.id)        
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to users_url
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to  user_recipe_url(@user,@recipe.id)
    end
  end

  def recipe_params
    return params.require(:recipe).permit(:user_id, :recipe_name, :description)
  end

end
