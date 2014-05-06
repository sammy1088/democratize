class City < ActiveRecord::Base
  OUR_EPOCH = Time.local(2005, 12, 8, 7, 46, 43).to_time
	has_many :links
	has_many :districts
  has_many :groups
  has_many :jobs
  has_many :resources
  has_many :events
  has_many :bills
  has_many :ads
  

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
