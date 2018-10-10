class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :country
      t.date :founded
      t.text :image
      
      t.timestamps
    end
  end
end
