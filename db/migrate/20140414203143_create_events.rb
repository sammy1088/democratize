class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
