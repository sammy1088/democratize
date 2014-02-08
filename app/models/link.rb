class Link < ActiveRecord::Base
	OUR_EPOCH = Time.local(2005, 12, 8, 7, 46, 43).to_time

  belongs_to :user
  belongs_to :state
  belongs_to :city
  belongs_to :district
  belongs_to :rep
  belongs_to :group
  
	has_many :votes, as: :votable 
  has_many :comments, as: :commentable





  def score
    ups = votes.where(:up => true).count
    downs = votes.where(:up => false).count
    ups - downs
  end
  

  def hot
  s = score
    displacement = Math.log( [s.abs, 1].max,  10 )
 
    sign = if s > 0
      1
    elsif s < 0
      -1
    else
      0
    end
 
    return (displacement * sign.to_f) + ( (created_at.to_i - OUR_EPOCH.to_i).to_f / 45000 )
  end 


  def user=(user)
    self.user_id = user.id
    self.username = user.username
  end

end
