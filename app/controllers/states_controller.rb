class StatesController < ApplicationController

def new
  @link = Link.new
end

def show
end

def index
	@link = Link.new
end

  def create
    @link = Link.new
    
  end

  def state_params
  params.require(:states).permit(:links)
end
end