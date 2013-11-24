class VotesController < ApplicationController
	before_filter :authenticate_user!



 def create
    @vote = current_user.votes.where(:link_id => params[:vote][:link_id]).first
    @vote = current_user.votes.create(vote_params)
    @vote.update_attributes(:up => params[:vote][:up])
    redirect_to :back
end

	def vote_params
  params.require(:vote).permit(:link_id, :up, :user_id)
end
end
