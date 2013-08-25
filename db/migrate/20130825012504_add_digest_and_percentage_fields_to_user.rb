class AddDigestAndPercentageFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :digest, :boolean
  	add_column :users, :alert_percent, :integer
  end
end
