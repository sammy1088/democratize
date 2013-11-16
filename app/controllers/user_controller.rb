class UserController < ApplicationController
def user_params
  params.require(:user).permit(:email, :username)
end
end