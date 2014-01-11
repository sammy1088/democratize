class CitiesController < ApplicationController
  def index
    @cities = City.all
    @links = Link.all

  end
  def new
  end
  def create
	 @city = City.new(city_params)
    @city.save
    redirect_to @city
  end
  def show
    @city = City.find(params[:id])
    @links = @city.links
    @city = City.find(params[:id])
    @districts = @city.districts
    @links = @links.sort_by{ |l| l.score }.reverse
  end
  private
   def city_params
    params.require(:city).permit(:title)
  end
end
