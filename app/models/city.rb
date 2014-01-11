class City < ActiveRecord::Base
	has_many :links
	has_many :districts
end
