class AddPartyIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :party_id, :integer
  end
end
