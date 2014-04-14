class AddCityIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :city_id, :integer
  end
end
