class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :author
      t.integer :published_year
      t.text :image
      t.timestamps
    end
  end
end
