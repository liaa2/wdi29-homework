class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :name
      t.text :location
      t.text :hobbies
      t.text :image

      t.timestamps
    end
  end
end
