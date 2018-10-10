class CreateRocks < ActiveRecord::Migration[5.2]
  def change
    create_table :rocks do |t|
      t.string :name
      t.string :colour
      t.string :meaning
      t.float  :hardness
    end
  end
end
