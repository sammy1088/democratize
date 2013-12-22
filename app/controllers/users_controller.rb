class UsersController < ApplicationController
def create
	
end

def index
  @user = User.new

	end

def show
	@user = User.find(params[:id])
	@links = @user.links
	
	end

def user_params
  params.require(:user).permit(:email, :username, :bio, :avatar)
end
end