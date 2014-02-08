class FollowGroup < ActiveRecord::Base

belongs_to :user
belongs_to :group
validates :user, uniqueness: :group_id



end