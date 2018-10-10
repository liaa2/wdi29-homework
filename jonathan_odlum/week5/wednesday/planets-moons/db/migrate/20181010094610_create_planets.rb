class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.text :name
      t.float :orbit
      t.float :temperature
      t.float :year
      t.float :day

      t.timestamps
    end
  end
end
