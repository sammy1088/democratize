class AddCityIdToDistrict < ActiveRecord::Migration
  def change
  	add_column :districts, :city_id, :integer
  end
end
