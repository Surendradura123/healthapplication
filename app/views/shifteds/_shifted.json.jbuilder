json.extract! shifted, :id, :firstname, :lastname, :dob, :email, :phone, :address, :firm, :cost, :description, :created_at, :updated_at
json.url shifted_url(shifted, format: :json)
