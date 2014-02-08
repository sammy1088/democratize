class CountriesController < ApplicationController
  def new
  end
  def create
  	@country = Country.new(country_params)
    @country.save
    redirect_to @country
  end
  def index
    @countries = Country.all
  end
  def show
  	@country = Country.find(params[:id])
    @links = @country.links
  end
   def destroy
    @country = Country.find(params[:id])
    @country.destroy

  end

  private
   def country_params
    params.require(:country).permit(:title)
  end
end
