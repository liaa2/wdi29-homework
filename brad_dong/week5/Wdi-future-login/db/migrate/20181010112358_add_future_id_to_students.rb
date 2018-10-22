class AddFutureIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :future_id, :integer
  end
end
