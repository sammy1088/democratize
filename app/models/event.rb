class Event < ActiveRecord::Base
  belongs_to :city
  belongs_to :district
end
