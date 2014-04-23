require 'will_paginate/array'
class JobsController < ApplicationController
	before_filter :find_parent, only: [:new, :create]

def new
	@job = Job.new
end

 def show

    if params[:state_id] or params[:city_id] or params[:district_id] or params[:country_id] or params[:rep_id] or params[:group_id]
       find_parent
    end
    @job = Job.find(params[:id])
    @comments = @job.comments 

  end

   def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end

def index
	if params[:state_id] or params[:city_id]
       find_parent
    end
  @groups = @parent.groups  
  @resources = @parent.resources
  @jobs = @parent.jobs
  @events = @parent.events
    
  @cities = City.all



      @jobs = @jobs.order(created_at: :desc)

  @jobs = @jobs.paginate(:page => params[:page], :per_page => 15)
end

def create
 @job = @parent.jobs.new(job_params)
 @job.user = current_user if current_user
    respond_to do |format|
      if @job.save
        format.html { redirect_to action: 'index', notice: 'Article was successfully created.' }
        format.json { render action: 'index', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
	end
def edit
@city = City.find(params[:city_id])
     @job = Job.find(params[:id])
end
  def update
@city = City.find(params[:city_id])
    @job = Job.find(params[:id])
 
    if @job.update(params[:job].permit(:title, :description, :companyname, :companyurl, :username, :user_id))
      redirect_to [@city, @job]
  else
    render 'edit'
  end
end
private
  def job_params
    params.require(:job).permit(:title, :description, :companyname, :companyurl, :username, :user_id)
  end
def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
      elsif params[:state_id]
      @parent = State.find(params[:state_id])
  end
end
end
