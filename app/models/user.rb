class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :links
has_many :votes
has_many :jobs
has_many :groups

has_many :comments
has_many :follow_groups
has_many :groups, through: :follow_groups
  
  before_save do
    self.username.downcase! if self.username
end

def self.find_for_authentication(conditions) 
  conditions[:username].downcase! 
  super(conditions) 
end 

  validates :bio, :length => { :minimum => 5, :maximum => 70 }


has_attached_file :avatar, :styles => { :main => "200x200#" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"


validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

def follow_group(group_id)
	group = Group.find(group_id)
	FollowGroup.create(user_id: id, group_id: group_id)
end
  
def email_required?
    false
  end

end
