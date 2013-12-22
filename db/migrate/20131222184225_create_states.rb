class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :title

      t.timestamps
    end
  end
end
