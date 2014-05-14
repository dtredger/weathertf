class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.timestamps
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :user, index: true
    end
  end
end


#  latitude                        :float
#  longitude                       :float
#  digest                          :boolean
#  alert_percent                   :integer
#  address                         :string(255)