class AddDistrictIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :district_id, :integer
  end
end
