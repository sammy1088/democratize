class Link < ActiveRecord::Base
	belongs_to :user

  def user=(user)
    self.user_id = user.id
    self.username = user.username
  end

end
