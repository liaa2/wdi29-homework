class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string  :name
      t.string  :iupac
      t.float   :molar_mass
      t.string  :uses
      t.string  :image
    end
  end
end
