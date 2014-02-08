class AddGroupIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :group_id, :integer
  end
end
