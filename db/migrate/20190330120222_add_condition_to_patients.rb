class AddConditionToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :condition, :string
  end
end
