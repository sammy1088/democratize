class UsersController < ApplicationController
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
  def create	
  end
  def index
    @user = User.new
    @users = User.all
  end
  def show
	@user = User.find(params[:id])
	@links = @user.links
  @groups = @user.groups
   ## @city = City.find(params[:id])
    ##@groups = @city.groups
  end
  def destroy
     @user = User.find(params[:id])
     @user.destroy
  end
  def user_params
    params.require(:user).permit(:email, :username, :bio, :avatar)
  end
end