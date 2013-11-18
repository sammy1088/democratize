class LinksController < ApplicationController
  def show
  end

  def new
  	@link = Link.new
  end

   def create
  	   @link = Link.new(link_params)
       @link.user = current_user if current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  def link_params
  params.require(:link).permit(:user_id, :url, :title, :username, :photo)
end

end
