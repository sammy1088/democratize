class Link < ActiveRecord::Base
	belongs_to :user
  belongs_to :states
  
	 has_many :votes 

has_attached_file :photo, :styles => { :small => "150x150#" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


  def self.sort_by_score
    self.all.sort_by {|link| link.score }.reverse
  end

  def score
    self.votes.where(:up => true).count - self.votes.where(:up => false).count
  end


  def user=(user)
    self.user_id = user.id
    self.username = user.username
  end

end
