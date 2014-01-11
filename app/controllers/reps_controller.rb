class RepsController < ApplicationController
  def index
  end
  def new
  end
  def create
  	@rep = Rep.new(rep_params)
    @rep.save
    redirect_to @rep
  end
  def show
  	@rep = Rep.find(params[:id])
  end
  private
   def rep_params
    params.require(:rep).permit(:title)
  end
end
