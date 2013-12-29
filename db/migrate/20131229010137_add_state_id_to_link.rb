class AddStateIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :state_id, :integer
  end
end
