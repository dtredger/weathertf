class ChangeLatandLonColumnstoFloat < ActiveRecord::Migration
  def change
  	change_column :users, :lat, :float
  	change_column :users, :lon, :float
  end
end
