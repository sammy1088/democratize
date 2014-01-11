class DistrictsController < ApplicationController
  before_filter :find_parent, only: [:new, :create]
  def new
    @district = District.new
  end
  def create
  	@district = @parent.districts.new(district_params)
    respond_to do |format|
      if @district.save
        format.html { redirect_to @parent, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @district }
      else
        format.html { render action: 'new' }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end
  def index
    @districts = District.all
    @links = Link.all
  end
  def show
  	@district = District.find(params[:id])
    @links = @district.links
  end
  private
   def district_params
    params.require(:district).permit(:title)
  end

  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
  end
end
end
