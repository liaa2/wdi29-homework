class CreateMoons < ActiveRecord::Migration[5.2]
  def change
    create_table :moons do |t|
      t.text :name
      t.integer :discovery
      t.text :discoverer
      t.text :image
      t.float :period
      t.integer :planet_id

      t.timestamps
    end
  end
end
