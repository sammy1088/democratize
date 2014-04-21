class AdsController < ApplicationController
  before_filter :find_parent
  def index
    @ads =  Ad.all
  end
  def new
    @ad = Ad.new
  end
  def create
    @ad = @parent.ads.new(ad_params)
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @parent, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
end
  private
  def ad_params
    params.require(:ad).permit(:title, :description, :photo)
  end
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
  end
end
end
