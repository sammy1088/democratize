class AddCityIdToResource < ActiveRecord::Migration
  def change
  	add_column :resources, :city_id, :integer
  end
end
