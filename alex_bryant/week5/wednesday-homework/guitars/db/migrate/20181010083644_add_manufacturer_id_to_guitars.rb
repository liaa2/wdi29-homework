class AddManufacturerIdToGuitars < ActiveRecord::Migration[5.2]
  def change
    add_column :guitars, :manufacturer_id, :integer
  end
end
