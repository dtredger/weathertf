class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :location
      t.string :carrier
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
