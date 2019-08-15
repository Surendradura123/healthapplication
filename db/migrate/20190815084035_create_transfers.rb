class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :email
      t.string :phone
      t.string :address
      t.decimal :cost
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
