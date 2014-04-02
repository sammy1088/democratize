class LinksController < ApplicationController
  before_filter :find_parent, only: [:new, :create]
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show, :new, :create]

  def index
    if params[:state_id] or params[:city_id] or params[:district_id] or params[:country_id] or params[:rep_id] or params[:group_id]
      
      find_parent
      @links = @parent.links
    else
      @links = Link.all

    end
    

    @links = @links.sort_by{ |l| l.hot }
   @links = Link.page params[:page]
  end
  def show

    if params[:state_id] or params[:city_id] or params[:district_id] or params[:country_id] or params[:rep_id] or params[:group_id]
       find_parent
    end
    @link = Link.find(params[:id])
    @comments = @link.comments 
    ##@city = City.find(params[:city_id])
    ##@groups = @city.groups
    ##@districts = @city.districts
   ## @resources = @city.resources
  end
 

  def new
  	@link = Link.new
    #@vote = Vote.new 
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
  end

  def create
    @link = @parent.links.new(link_params)
     @link.user = current_user if current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to [@parent, @link], notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
  def link_params
    params.require(:link).permit(:user_id, :title, :username, :text)
  end

  
  def find_parent
    if params[:city_id]
      @parent = City.find(params[:city_id])
    elsif params[:state_id]
      @parent = State.find(params[:state_id])
    elsif params[:country_id]
      @parent = Country.find(params[:country_id])
    elsif params[:district_id]
      @parent = District.find(params[:district_id])  
    elsif params[:rep_id]
      @parent = Rep.find(params[:rep_id])
    elsif params[:group_id]
      @parent = Group.find(params[:group_id])  
    else
     raise "New link must be nested"
    end
  end
end

