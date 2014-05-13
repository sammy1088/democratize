require 'will_paginate/array'
class BillsController < ApplicationController
  before_filter :find_parent, only: [:new, :create]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", only: [:new, :create]
  
  def new
    @bill = @parent.bills.new
  end
  
  def show 
    if params[:state_id] or params[:city_id]
       find_parent
    end
    @bill = Bill.find(params[:id])
    @comments = @bill.comments

    
  end
  
    def create
    @bill = @parent.bills.new(bill_params)
    respond_to do |format|
      if @bill.save
        format.html { redirect_to :action => :index, notice: 'Event was successfully created.' }
        format.json { render json: @bill, status: :created, location: @bill }
      else
        format.html { render action: "new" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit

    @bill = Bill.find(params[:id])
end
  def update

    @bill = Bill.find(params[:id])
 
    if @bill.update(params[:bill].permit(:title, :date, :description))
      redirect_to [@bill]
  else
    render 'edit'
  end
end
  
  def index
    if params[:state_id] or params[:city_id] or params[:country_id]
       find_parent
    end
    @groups = @parent.groups  
    @resources = @parent.resources
    @jobs = @parent.jobs.limit(5)
    @bills = @parent.bills
    @bills = @bills.where(['date >= ?', DateTime.now.to_date]).paginate(:page => params[:page], :per_page => 15)
      respond_to do |format|
    format.html               # /app/views/articles/index.html.erb
    format.html.tablet     # /app/views/posts/index.html+tablet.erb
    end
  end
  private
  def bill_params
    params.require(:bill).permit(:title, :date, :description)
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
