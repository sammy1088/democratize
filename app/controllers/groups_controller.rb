require 'will_paginate/array'
class GroupsController < ApplicationController
	before_filter :find_parent, only: [:new, :create, :show]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show, :follow]
def new
    @group = Group.new
  end

   def index
    @groups = Group.all
  end
def create
	@group = @parent.groups.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @parent, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

def show
@group = Group.find(params[:id])
 
  @groups = @parent.groups
  @resources = @parent.resources
  

  
  @links = @group.links
    
    @cities = City.all
    @users = @group.users

    if params[:sort_by] == "new"
      puts "sort queries called"
      @links = @links.order(created_at: :desc)
    else
    @links = @links.sort_by{ |l| l.hot }.reverse
    end
  @links = @links.paginate(:page => params[:page], :per_page => 10)
        respond_to do |format|
    format.html               # /app/views/articles/index.html.erb
    format.html.tablet     # /app/views/posts/index.html+tablet.erb
    end

end
    def edit
    @city = City.find(params[:city_id])
    @group = Group.find(params[:id])
end
  def update
    @city = City.find(params[:city_id])
    @group = Group.find(params[:id])
 
    if @group.update(params[:group].permit(:title))
      redirect_to [@city, @group]
  else
    render 'edit'
  end
end
def follow
    current_user.follow_group(params[:id])
    redirect_to :back
end

private


   def group_params
    params.require(:group).permit(:title)
  end
  
   def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
    end
end
end



