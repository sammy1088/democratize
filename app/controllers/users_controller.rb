class UsersController < ApplicationController
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
  before_filter :find_parent, only: [:new, :create]
  def create	
  end
  def index
    @user = User.new
    @users = User.all
  end
  def show
if params[:state_id] or params[:city_id]
       find_parent
    end
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
  private
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
      elsif params[:state_id]
      @parent = State.find(params[:state_id])
  end

  def user_params
    params.require(:user).permit(:username, :bio, :avatar)
  end
end
end