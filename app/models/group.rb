class Group < ActiveRecord::Base
	OUR_EPOCH = Time.local(2005, 12, 8, 7, 46, 43).to_time
	has_many :links
	belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :user
	has_many :follow_groups
	has_many :users, through: :follow_groups
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

end
