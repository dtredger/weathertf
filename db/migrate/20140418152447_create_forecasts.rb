class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.float :humidity
      t.float :precipIntensity
      t.float :precipProbability
      t.string :precipType
      t.string :summary
      t.float :temperature
      t.integer :time
      t.float :visibility
      t.float :latitude
      t.float :longitude
      t.references :user, index: true

      t.timestamps
    end
  end
end
