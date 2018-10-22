class CreateCampsites < ActiveRecord::Migration[5.2]
  def change
    create_table :campsites do |t|
      t.text          :name
      t.text          :location
      t.text          :campsite_type
      t.integer       :max_people
      t.float         :per_night
      t.timestamps
    end
  end
end
