json.extract! transfer, :id, :firstname, :lastname, :dob, :email, :phone, :address, :cost, :date, :description, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
