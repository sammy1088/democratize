class AddTextToLink < ActiveRecord::Migration
  def change
  	add_column :links, :text, :text
  end
end
