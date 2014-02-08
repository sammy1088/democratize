class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title

      t.timestamps
    end
  add_column :groups, :city_id, :integer  
  end
end
