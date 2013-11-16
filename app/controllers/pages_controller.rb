class PagesController < ApplicationController
  def index
  	@links = Link.all
  	@user = User.all
  	  	
  	
  	
  end
end