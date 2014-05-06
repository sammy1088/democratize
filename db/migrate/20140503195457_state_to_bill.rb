class StateToBill < ActiveRecord::Migration
  def change
    add_column :bills, :city_id, :integer
  	add_column :bills, :state_id, :integer 
  end
end
