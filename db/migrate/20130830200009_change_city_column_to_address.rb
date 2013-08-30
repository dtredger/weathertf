class ChangeCityColumnToAddress < ActiveRecord::Migration
  def change
  			rename_column :users, :city, :address
  end
end
