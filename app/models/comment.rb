class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, polymorphic: true
	belongs_to :link
	
	has_many :comments, as: :commentable
	has_many :votes, as: :votable 

	 def score
    ups = votes.where(:up => true).count
    downs = votes.where(:up => false).count
    ups - downs
  end

  def user=(user)
    self.user_id = user.id
    self.username = user.username
  end
	
end