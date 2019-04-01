json.extract! doctor, :id, :firstname, :lastname, :email, :phone, :address, :specialist, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
