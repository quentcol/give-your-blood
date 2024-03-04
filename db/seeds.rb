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

#center_data

#center data
center_1 = { address: "Maasstadweg 21", name: "Maasstad hospital" }
center_2 = { address: "Reinier de Graafweg 1", name: "Reinier de graaf hospital" }
center_3 = { address: "Lijnbaan 32", name: "Hagaziekenhuis"}


#create center
[center_1, center_2, center_3].each do |info|
  center = Center.create!(info)
  puts "created #{center.adress}"
end

puts 'Created centers!'
