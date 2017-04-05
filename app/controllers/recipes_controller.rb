class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
     # binding.pry
     @activity = PublicActivity::Activity.find_by(trackable_id: (params[:user_id]), trackable_type: controller_path.classify)
    @allRecipe = @user.recipes.all
  end

  def show
    # binding.pry
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
        redirect_to user_recipes_path(@user.id)        
    end
  end

  def destroy
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    # binding.pry
    # @publicData =  PublicActivity::Activity.find(params[:id])
  end

  def update
    # binding.pry
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to  user_recipe_url(@recipe)
    end
  end

  def recipe_params
    return params.require(:recipe).permit(:user_id, :recipe_name, :description)
  end

end
