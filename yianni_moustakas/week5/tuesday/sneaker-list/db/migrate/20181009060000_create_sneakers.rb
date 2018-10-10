class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.string  :brand
      t.string  :silhouette
      t.string  :colorway
      t.string  :description
      t.integer :heat_rating
      t.integer :release_date
      t.text    :image_url


      t.timestamps
    end
    end
  end
