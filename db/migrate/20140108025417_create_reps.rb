class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.string :title

      t.timestamps
    end
  end
end
