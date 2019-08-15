class Doctor < ActiveRecord::Base
  has_many :patients
  belongs_to :user



  def self.search(params)
    doctors = Doctor.where("firstname LIKE ? or lastname LIKE ?", "%#{params[:search]}%",
       "%#{params[:search]}%")if params[:search].present?
      doctors
  end


  


end
