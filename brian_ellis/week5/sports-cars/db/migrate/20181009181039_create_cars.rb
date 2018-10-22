class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :engine
      t.integer :horsepower
      t.integer :country
      t.integer :turbocharged
    end
  end
end
