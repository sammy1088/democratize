class CountryLikeState < ActiveRecord::Migration
  def change
      	add_column :events, :country_id, :integer
  	add_column :groups, :country_id, :integer 
  	add_column :jobs, :country_id, :integer 
  	add_column :resources, :country_id, :integer
      	add_column :bills, :country_id, :integer
      add_column :ads, :country_id, :integer
    add_column :ads, :state_id, :integer
  end
end
