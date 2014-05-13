require 'will_paginate/array'
class CountriesController < ApplicationController
    before_filter :find_parent, only: [:new, :create]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
    
  def slug
    name.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end
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
 @link = Link.find(params[:id])
    @comments = @link.comments

    ##n@district = District.find(params[:id])
    
   
  
    @links = @country.links
    @groups = @country.groups
    @resources = @country.resources
    @ads = @country.ads
    @jobs = @country.jobs.limit(5)
    @events = @country.events.where(['date >= ?', DateTime.now.to_date]).limit(5)
    @bills = @country.bills.where(['date >= ?', DateTime.now.to_date]).limit(2)
    
    
    if params[:sort_by] == "new"
      puts "sort queries called"
      
      @links = @links.order(created_at: :desc)

    else
    
    @links = @links.sort_by{ |l| l.hot }.reverse
    
    
    end

    @links = @links.paginate(:page => params[:page], :per_page => 15)
      respond_to do |format|
    format.html               # /app/views/articles/index.html.erb
    format.html.tablet     # /app/views/posts/index.html+tablet.erb
    end

  end
   def destroy
    @country = Country.find(params[:id])
    @country.destroy

  end

  private
   def country_params
    params.require(:country).permit(:title, :slug)
  end
    def find_parent
    if params[:country_id]
      @parent = Country.find(params[:country_id])
  end
end
end
