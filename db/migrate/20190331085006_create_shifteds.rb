class CreateShifteds < ActiveRecord::Migration[5.1]
  def change
    create_table :shifteds do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :email
      t.string :phone
      t.string :address
      t.string :firm
      t.decimal :cost
      t.string :description

      t.timestamps
    end
  end
end
