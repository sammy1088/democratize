class District < ActiveRecord::Base
	has_many :links
	belongs_to :city
end
