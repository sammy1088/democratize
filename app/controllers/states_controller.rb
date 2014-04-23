require 'will_paginate/array'
class StatesController < ApplicationController
  before_filter :find_parent, only: [:new, :create]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
  
  def slug
    name.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end

  
  def index
    @states = State.all
    @links = Link.all

  end
  def new
    @state = State.new
    ##@link = @parent.links.new(link_params)
  end
  def create
   ##@link = @parent.links.new(link_params)
    @state = State.new(state_params)
    @state.save
    redirect_to @state
  end
  def destroy
    @state = State.find(params[:id])
    @state.destroy
  end

  def show
    @state = State.find(params[:id])
 @link = Link.find(params[:id])
    @comments = @link.comments

    ##n@district = District.find(params[:id])
    
   
  
    @links = @state.links
    @groups = @state.groups
    @resources = @state.resources
    @ads = @state.ads
    @jobs = @state.jobs.limit(5)
    @events = @state.events.limit(5).sort! {|a,b| a.date <=> b.date }
    
    
    if params[:sort_by] == "new"
      puts "sort queries called"
      
      @links = @links.order(created_at: :desc)

    else
    
    @links = @links.sort_by{ |l| l.hot }.reverse
    
    
    end

    @links = @links.paginate(:page => params[:page], :per_page => 15)

  end
  private
  def state_params
    params.require(:state).permit(:title, :slug)
  end
  def find_parent
    if params[:state_id]
      @parent = City.find(params[:state_id])
  end
end
end
