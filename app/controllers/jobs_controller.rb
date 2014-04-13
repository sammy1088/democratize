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
	
	

  @city = City.find(params[:city_id])
  
  @groups = @city.groups  
  @districts = @city.districts
  @resources = @city.resources
  @jobs = @city.jobs
    
  
  

  @cities = City.all



      @jobs = @jobs.order(created_at: :desc)

  @jobs = @jobs.paginate(:page => params[:page], :per_page => 15)
end

def create
 @job = @parent.jobs.new(job_params)
 @job.user = current_user if current_user
    respond_to do |format|
      if @job.save
        format.html { redirect_to [@parent, @job], notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
	end

private
  def job_params
    params.require(:job).permit(:title, :description, :companyname, :companyurl, :username, :user_id)
  end
def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
  end
end
end
