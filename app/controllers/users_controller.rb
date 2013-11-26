class UsersController < ApplicationController
def create
	
end

def show
	@user = User.find(params[:id])
	
	end

def user_params
  params.require(:user).permit(:email, :username, :bio, :avatar)
end
end