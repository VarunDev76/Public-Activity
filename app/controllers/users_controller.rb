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
    @user =  User.find(params[:id]) #PublicActivity::Activity.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_url     
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_url
    end
  end

  def user_params
    return params.require(:user).permit(:name, :password)
  end

end
