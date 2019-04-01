json.extract! patient, :id, :firstname, :lastname, :dob, :email, :phone, :address, :doctor_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
