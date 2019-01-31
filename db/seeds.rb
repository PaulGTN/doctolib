# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
Skill.destroy_all


20.times do 
  city = City.create!(zip_code: Faker::Address.zip)
end

10.times do 
  doctor = Doctor.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, zip_code: Faker::Address.zip, city_id: (rand(City.first.id..City.last.id)))
end

10.times do 
  patient = Patient.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, city_id: (rand(City.first.id..City.last.id)))
end

20.times do 
  appointment = Appointment.create!(date: Faker::Time.forward(20, :day), doctor_id: (rand(Doctor.first.id..Doctor.last.id)), patient_id: (rand(Patient.first.id..Patient.last.id)), city_id: (rand(City.first.id..City.last.id)))
end

10.times do
  specialty = Specialty.create!(name: Faker::Beer.name)
end

20.times do 
  skill = Skill.create!(doctor_id: (rand(Doctor.first.id..Doctor.last.id)), specialty_id: (rand(Specialty.first.id..Specialty.last.id)))
end 



