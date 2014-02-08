class ResourcesController < ApplicationController
	before_filter :find_parent, only: [:new, :create]
  def show
  end

  def new
  	@resource = Resource.new
  end

  def index
@resources = Resource.all
  end

   def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
  end

  def create
    @resource = @parent.resources.new(resource_params)
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @parent, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def resource_params
    params.require(:resource).permit(:url, :title)
  end
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
  end
end
end