class ChangeTableUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :integer
  	add_column :users, :carrier, :string
  end
end
