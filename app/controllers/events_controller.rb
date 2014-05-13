require 'will_paginate/array'
class EventsController < ApplicationController
	before_filter :find_parent, only: [:new, :create]
  def index

    if params[:state_id] or params[:city_id] or params[:country_id]
       find_parent
    end
    @groups = @parent.groups  
    @resources = @parent.resources
    @jobs = @parent.jobs.limit(5)
    @events = @parent.events
    @events = @events.where(['date >= ?', DateTime.now.to_date]).paginate(:page => params[:page], :per_page => 15)
      respond_to do |format|
    format.html               # /app/views/articles/index.html.erb
    format.html.tablet     # /app/views/posts/index.html+tablet.erb
    end
  end
    def new
     
      @event = @parent.events.new

  end
  def show 
    if params[:state_id] or params[:city_id] or params[:district_id] or params[:country_id] or params[:rep_id] or params[:group_id]
       find_parent
    end
    @event = Event.find(params[:id])
    @comments = @event.comments
    
  end
  def create
    @event = @parent.events.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to :action => :index, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
   def edit
@city = City.find(params[:city_id])
     @event = Event.find(params[:id])
end
  def update
@city = City.find(params[:city_id])
    @event = Event.find(params[:id])
 
    if @event.update(params[:event].permit(:title, :date, :description, :location))
      redirect_to [@city, @event]
  else
    render 'edit'
  end
end
  private
  def event_params
    params.require(:event).permit(:title, :date, :description, :location)
  end
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
      elsif params[:state_id]
      @parent = State.find(params[:state_id])
            elsif params[:country_id]
      @parent = Country.find(params[:country_id])
  end
end
end