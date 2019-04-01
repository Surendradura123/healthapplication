class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :email
      t.string :phone
      t.string :address
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
