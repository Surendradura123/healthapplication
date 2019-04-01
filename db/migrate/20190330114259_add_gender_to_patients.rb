class AddGenderToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :gender, :string
  end
end
