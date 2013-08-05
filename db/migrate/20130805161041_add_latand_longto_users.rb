class AddLatandLongtoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :lat, :integer
  	add_column :users, :lon, :integer
  end
end
