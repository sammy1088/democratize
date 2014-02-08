class StatesController < ApplicationController
  
  def index
    @states = State.all
    @links = Link.all
  end

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
    @districts = @city.districts
    @groups = @city.groups
    @resources = @city.resources
    @jobs = @city.jobs
    
    
    if params[:sort_by] == "new"
      puts "sort queries called"
      @links = @links.order(created_at: :desc)
    else
    @links = @links.sort_by{ |l| l.hot }.reverse
    end
  end
  def destroy
    @state = State.find(params[:id])
    @state.destroy
  end
  private
   def state_params
    params.require(:state).permit(:title)
  end
end
