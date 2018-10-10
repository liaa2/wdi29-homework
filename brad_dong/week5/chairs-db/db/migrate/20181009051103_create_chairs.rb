class CreateChairs < ActiveRecord::Migration[5.2]
  def change
    create_table :chairs do |t|
    t.string :name
    t.text :image
    t.integer :legs
    t.text :material
    t.boolean :recliner

    #creates 2 date columns, date created and date modified
    t.timestamps
    end
  end
end
