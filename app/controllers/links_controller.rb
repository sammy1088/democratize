class LinksController < ApplicationController
  before_filter :find_state, only: [:new, :create]

  def index
    if params[:state_id]
      find_state
      @links = @state.links
    else
      @links = Link.all
    end
  end

  def new
  	@link = Link.new
  #  @vote = Vote.new 
  end

  def create
    @link = @state.links.new(link_params)
     @link.user = current_user if current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  def link_params
  params.require(:link).permit(:user_id, :title, :username, :text)
end

  private
  def find_state
    @state = State.find(params[:state_id])
  end
end
