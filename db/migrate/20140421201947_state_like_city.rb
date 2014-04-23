class StateLikeCity < ActiveRecord::Migration
  def change
  	add_column :events, :state_id, :integer
  	add_column :groups, :state_id, :integer 
  	add_column :jobs, :state_id, :integer 
  	add_column :resources, :state_id, :integer 
  end
end
