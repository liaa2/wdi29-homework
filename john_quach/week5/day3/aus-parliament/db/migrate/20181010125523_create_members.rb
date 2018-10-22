class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.text :name
      t.text :about
      t.text :title
      t.text :seat
      t.text :image

      t.timestamps
    end
  end
end
