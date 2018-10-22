class CreateFutures < ActiveRecord::Migration[5.2]
  def change
    create_table :futures do |t|
      t.text :name
      t.integer :year
      t.text :location
      t.text :image

      t.timestamps
    end
  end
end
