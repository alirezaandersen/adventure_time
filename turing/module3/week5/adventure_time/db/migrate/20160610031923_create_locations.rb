class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zip
      t.string :city
      t.string :state
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
