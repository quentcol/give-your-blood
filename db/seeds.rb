# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#Patient.destroy_all
#puts 'cleaned patients'
#Center.destroy_all
#puts 'cleaned'

#patient data
#patient_1 = { adress: "Damrak 32", blood_type: "O-positive", birthdate: "02-12-1998", first_name: "John", last_name: "Williams" }

#create patient
#Patient = Patient.create!(patient_1)

#puts 'created patient!'

#create user

Center.delete_all
Hospital.delete_all
User.delete_all


user_1 = {email: 'host-a@host.com', password: 'password123' }
user_2 = { email: 'host-b@host.com', password: 'password12' }

[user_1, user_2].each do |info|
  user = User.create!(info)
  puts "created #{user.email}"
end

hospital_1 = { hospital_name: "Hagaziekenhuis", user_id: "#{User.first.id}" }
hospital_2 = { hospital_name: "LUMC", user_id: "#{User.first.id}" }

[hospital_1, hospital_2].each do |info|
  hospital = Hospital.create!(info)
  puts "created #{hospital.hospital_name}"
end

#center data
center_1 = { address: "Maasstadweg 21", name: "Maasstad hospital", hospital_id: "#{Hospital.first.id}" }
center_2 = { address: "Reinier de Graafweg 1", name: "Reinier de graaf hospital", hospital_id: "#{Hospital.first.id}" }
center_3 = { address: "Lijnbaan 32", name: "Hagaziekenhuis", hospital_id: "#{Hospital.first.id}" }


#create center
[center_1, center_2, center_3].each do |info|
  center = Center.create!(info)
  puts "created #{center.address}"
end

puts 'Created centers!'
weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday]

# Iterate over each weekday and create a corresponding record in the 'days' table
weekdays.each do |day_name|
  Day.create(name: day_name)
end
