class AddCityIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :city_id, :integer
  end
end
