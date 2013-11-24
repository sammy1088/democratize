class UsersController < ApplicationController
def create
	
end

def user_params
  params.require(:user).permit(:email, :username)
end
end