class CreateNationalParks < ActiveRecord::Migration
  def change
    create_table :national_parks do |t|
      t.string :name
      t.string :lat
      t.string :long
      t.string :state
      t.string :est_year
      t.string :url

      t.timestamps null: false
    end
  end
end
