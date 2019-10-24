# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all

def random
	genre_list = Array.new
	genre_list = ["chirurgien", "ophtalmologue", "kinesithérapeute", "gynécologue", "vétérinaire", "psychiatre"].shuffle
	genre = genre_list.first
	return genre
end

def random_city
	name_list = Array.new
	name_list = ["Lille", "Paris", "Los Angeles", "Miami", "Roubaix", "Madrid", "Anatanarivo", "Moscou", "Berlin", "Londre", "Tourcoing", "Montcuq", "Longcochon", "Le Fion"].shuffle
	city = name_list.first
	return city
end

50.times do
	city = City.create!(name: random_city)
  patient = Patient.create!(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, city: city)
  doctor = Doctor.create!(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name,speciality: random,zip_code: Faker::Address.zip_code, city: city)  
  appoint = Appointment.create!(doctor: doctor, patient: patient, date: Faker::Time.forward(days: 50, period: :morning, format: :short), city: city)
end