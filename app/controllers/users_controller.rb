class UsersController < ApplicationController
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
  end
  def user_params
    params.require(:user).permit(:email, :username, :bio, :avatar)
  end
end