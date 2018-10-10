class CreateWorldLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :world_leaders do |t|
      t.string  :name
      t.string  :country
      t.string  :years_in_office
      t.boolean :alive
      t.text    :image
      t.text    :quote
      t.timestamps
    end
  end
end
