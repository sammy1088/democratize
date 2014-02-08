class CreateFollowGroups < ActiveRecord::Migration
  def change
    create_table :follow_groups do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
    add_index :follow_groups, :group_id
    add_index :follow_groups, :user_id
  end
end
