class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|

      # ID is not required as it is always implied (since it is essential)

      t.string :name
      t.text :description
      t.text :sample_hello_world
      t.boolean :imperative
      t.boolean :object_oriented
      t.boolean :functional
      t.boolean :procedural
      t.boolean :generic
      t.boolean :reflective
      t.boolean :event_driven
      t.text :other_paradigms
      t.text :standardized

      #Create two date columns: data_created, and date_modified
      t.timestamps
    end
  end
end
