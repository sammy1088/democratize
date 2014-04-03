class VotesController < ApplicationController
	before_filter :authenticate_user!
  

 def create
  if params[:comment_id]
          votable = Comment.find(params[:comment_id]) 
        elsif params[:link_id]
          votable = Link.find(params[:link_id])
    else
      raise "Vote can't be orphaned"
  end
   
   @vote = current_user.votes.build(vote_params.merge(votable_id: votable.id, votable_type: votable.class.name))
   ## @vote.update_attributes(:up => params[:vote][:up])
   @vote.up = params[:vote][:up]
   @vote.save!
    redirect_to :back
end

	def vote_params
  params.require(:vote).permit(:up)
end
end
