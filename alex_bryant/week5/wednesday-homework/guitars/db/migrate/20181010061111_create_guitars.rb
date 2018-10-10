class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :name
      t.string :guitar_type
      t.integer :price
      t.text :image

      t.timestamps
    end
  end
end
