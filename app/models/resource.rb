class Resource < ActiveRecord::Base
 belongs_to :city
  belongs_to :state
  belongs_to :country

end
