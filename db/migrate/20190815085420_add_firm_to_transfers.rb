class AddFirmToTransfers < ActiveRecord::Migration[5.1]
  def change
    add_column :transfers, :firm, :string
  end
end
