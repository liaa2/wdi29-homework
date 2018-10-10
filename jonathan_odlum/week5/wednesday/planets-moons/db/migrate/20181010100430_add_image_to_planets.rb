class AddImageToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_column :planets, :image, :text
  end
end
