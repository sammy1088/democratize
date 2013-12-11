class StatesController < ApplicationController

def show
end

def index
	@link = Link.new
	 @links = Link.limit(2)

end



end
