class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.date :date
      t.string :description
      t.timestamps
    end
  end
end
