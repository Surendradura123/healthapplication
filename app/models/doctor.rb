class Doctor < ActiveRecord::Base
  has_many :patients
  belongs_to :user
end
