class Bill < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :district
  has_many :links
  
  has_many :votes, as: :votable 
  has_many :comments, as: :commentable
end
