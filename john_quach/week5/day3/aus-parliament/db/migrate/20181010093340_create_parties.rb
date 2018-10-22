class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.text :name
      t.date :founded
      t.text :abbr
      t.text :leader
      t.text :position
      t.text :ideology

      t.timestamps
    end
  end
end
