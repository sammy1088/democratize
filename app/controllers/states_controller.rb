class StatesController < ApplicationController
	def new
	end
	def create
		 @state = State.new(state_params)
  @state.save
  redirect_to @state
	end
	def show
  @state = State.find(params[:id])
  @links = @state.links
  
end

def index
	@states = State.all
	@links = Link.all
	end

	private
  def state_params
    params.require(:state).permit(:title)
  end
end
