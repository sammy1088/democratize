require 'will_paginate/array'
class EventsController < ApplicationController
	before_filter :find_parent, only: [:new, :create]
  def index
 @city = City.find(params[:city_id])
  
  @groups = @city.groups  
  @districts = @city.districts
  @resources = @city.resources
  @jobs = @city.jobs
    @events = @city.events
      @cities = City.all


    @events = @events.paginate(:page => params[:page], :per_page => 15)

  end
    def new
    @event = Event.new

  end
  def create
    @event = @parent.events.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to [@parent, @event], notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def event_params
    params.require(:event).permit(:title, :date, :description, :location)
  end
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
  end
end
end