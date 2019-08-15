class Shifted < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Shifted.create! row.to_hash
    end
  end


end
