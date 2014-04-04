require 'will_paginate/array'
class DistrictsController < ApplicationController
  before_filter :find_parent, only: [:new, :create]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
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

  @city = City.find(params[:city_id])
  
  @groups = @city.groups  
  @districts = @city.districts
  @resources = @city.resources
  @jobs = @city.jobs
    
  @district = District.find(params[:id])
  @links = @district.links

  @cities = City.all


     if params[:sort_by] == "new"
      puts "sort queries called"
      @links = @links.order(created_at: :desc)
    else
    @links = @links.sort_by{ |l| l.hot }.reverse
    end
@links = @links.paginate(:page => params[:page], :per_page => 10)
  end
  def edit
    @city = City.find(params[:city_id])
    @district = District.find(params[:id])
end
  def update
    @city = City.find(params[:city_id])
    @district = District.find(params[:id])
 
    if @district.update(params[:district].permit(:title))
      redirect_to [@city, @district]
  else
    render 'edit'
  end
end
  def destroy
    @district = District.find(params[:id])
    @district.destroy
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
