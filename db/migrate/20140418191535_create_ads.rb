class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
    add_column :ads, :city_id, :integer
  end
end
