class AddStuffToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :description, :string
  	add_column :jobs, :companyurl, :string
  	add_column :jobs, :companyname, :string
  	add_column :jobs, :username, :string
  	add_column :jobs, :user_id, :integer
  end
end
