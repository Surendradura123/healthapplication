class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :address
      t.string :specialist

      t.timestamps
    end
  end
end
