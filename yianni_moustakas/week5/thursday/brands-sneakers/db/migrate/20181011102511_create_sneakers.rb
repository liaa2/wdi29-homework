class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.text :name
      t.text :silhouette
      t.text :color
      t.text :release_date
      t.text :image
      t.integer :brand_id

      t.timestamps
    end
  end
end
