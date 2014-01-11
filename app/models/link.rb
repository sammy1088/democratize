class Link < ActiveRecord::Base
	belongs_to :user
  belongs_to :state
  belongs_to :city
  belongs_to :district
  belongs_to :rep
  
	has_many :votes 



  

  def score
    self.votes.where(:up => true).count - self.votes.where(:up => false).count
  end


  def user=(user)
    self.user_id = user.id
    self.username = user.username
  end

end
