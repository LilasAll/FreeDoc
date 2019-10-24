class Speciality < ApplicationRecord
	has_many :jointables
	has_many :doctors, through: :jointables
end
