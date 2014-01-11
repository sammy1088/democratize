class AddCountryIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :country_id, :integer
  end
end
