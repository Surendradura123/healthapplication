class AddLevelToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :level, :integer
  end
end
