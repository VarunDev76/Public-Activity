class UsersController < ApplicationController
  def index
    @allUser = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path            
    end
  end

  def show
    # binding.pry
    @publicData =  User.find(params[:id]).recipes #PublicActivity::Activity.find(params[:id])
  end

  def destroy
  end

  def edit
    # binding.pry
    @user = Recipe.find(params[:id]).user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url
    end
  end

  def user_params
    return params.require(:user).permit(:name, :password)
  end

end
