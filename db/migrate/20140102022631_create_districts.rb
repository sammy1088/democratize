class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :title

      t.timestamps
    end
  end
end
