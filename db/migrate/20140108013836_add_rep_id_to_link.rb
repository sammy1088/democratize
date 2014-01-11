class AddRepIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :rep_id, :integer
  end
end
