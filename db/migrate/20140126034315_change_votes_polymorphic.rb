class ChangeVotesPolymorphic < ActiveRecord::Migration
  def change
  	
  	remove_column :votes, :link_id
  	add_column :votes, :votable_id, :integer
  	add_column :votes, :votable_type, :integer
  	add_index :votes, [:votable_id, :votable_type]
  end
end
