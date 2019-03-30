class CreateRotatesSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :rotates_sneakers do |t|
      t.integer :rotate_id
      t.integer :sneaker_id
    end
  end
end
