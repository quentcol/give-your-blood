# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Review.delete_all
Appointment.delete_all
Schedule.delete_all
Center.delete_all
Hospital.delete_all
Donor.delete_all
User.delete_all
Day.delete_all


puts "creating users"
user_1 = User.create!({ email: 'host-a@host.com', password: 'password123', category: 'hospital' })

user_2 = User.create!({ email: 'host-b1@host.com', password: 'password12', category: 'hospital' })

user_3 = User.create!({ email: 'host-b2@host.com', password: 'password1234', category: 'donor' })

user_4 = User.create!({ email: 'test@gmail.com', password: 'test123', category: 'donor' })

user_5 = User.create!({ email: 'user1@example.com', password: 'user123', category: 'hospital' })

user_6 = User.create!({ email: 'user2@example.com', password: 'user456', category: 'donor' })

user_7 = User.create!({ email: 'user3@example.com', password: 'user789', category: 'donor' })

user_8 = User.create!({ email: 'user4@example.com', password: 'user000', category: 'hospital' })


puts "creating donors"
donor_1 = { user: user_1, first_name: 'Iheb', last_name: "Laib", blood_type: 'A+', address: 'New York', birthdate: '1995-01-01' }
donor_2 = { user: user_2, first_name: 'Mahmoud', last_name: "Moursay", blood_type: 'B+', address: 'Los Angeles', birthdate: '1990-01-01' }
donor_3 = { user: user_3, first_name: 'Robin', last_name: "Gerritsen", blood_type: 'O+', address: 'Chicago', birthdate: '1992-01-01' }
donor_4 = { user: user_4, first_name: 'John', last_name: "Aren", blood_type: 'O+', address: 'Washington', birthdate: '1993-01-01' }
donor_5 = { user: user_5, first_name: 'Linda', last_name: "Smith", blood_type: 'AB-', address: 'Amsterdam', birthdate: '1988-05-15' }
donor_6 = { user: user_6, first_name: 'Emma', last_name: "Johnson", blood_type: 'O-', address: 'Rotterdam', birthdate: '1991-08-20' }
donor_7 = { user: user_7, first_name: 'Tom', last_name: "Wilson", blood_type: 'A-', address: 'The Hague', birthdate: '1985-11-10' }
donor_8 = { user: user_8, first_name: 'Sophia', last_name: "Brown", blood_type: 'B-', address: 'Utrecht', birthdate: '1997-03-25' }

[donor_1, donor_2, donor_3, donor_4, donor_5, donor_6, donor_7, donor_8].each do |info|
  donor = Donor.create!(info)
  puts "created #{donor.first_name}"
end

puts "creating hospitals"
hospital_1 = Hospital.create!({ user: user_1, hospital_name: 'General Hospital' })
hospital_2 = Hospital.create!({ user: user_2, hospital_name: 'Children Hospital' })
hospital_3 = Hospital.create!({ user: user_3, hospital_name: 'Veterans Hospital' })
hospital_4 = Hospital.create!({ user: user_4, hospital_name: 'Kingston Hospital' })
hospital_5 = Hospital.create!({ user: user_5, hospital_name: 'City Hospital' })
hospital_6 = Hospital.create!({ user: user_6, hospital_name: 'University Hospital' })
hospital_7 = Hospital.create!({ user: user_7, hospital_name: 'Saint Mary Hospital' })
hospital_8 = Hospital.create!({ user: user_8, hospital_name: 'Royal Hospital' })

puts "creating centers"
center_1 = Center.create!({ hospital: hospital_1, name: 'General Hospital', address: 'Leidschedam' })
center_2 = Center.create!({ hospital: hospital_2, name: 'Children Hospital', address: 'Schiedam' })
center_3 = Center.create!({ hospital: hospital_3, name: 'Veterans Hospital', address: 'Wateringen' })
center_4 = Center.create!({ hospital: hospital_4, name: 'Kingston Hospital', address: 'Delft' })
center_5 = Center.create!({ hospital: hospital_5, name: 'City Hospital', address: 'Amsterdam' })
center_6 = Center.create!({ hospital: hospital_6, name: 'University Hospital', address: 'Rotterdam' })
center_7 = Center.create!({ hospital: hospital_7, name: 'Saint Mary Hospital', address: 'The Hague' })
center_8 = Center.create!({ hospital: hospital_8, name: 'Royal Hospital', address: 'Utrecht' })

puts "creating days"

monday = Day.create!(name: 'Monday')
tuesday = Day.create!(name: 'Tuesday')
wednesday = Day.create!(name: 'Wednesday')
thursday = Day.create!(name: 'Thursday')
friday = Day.create!(name: 'Friday')

puts "creating schedules"

Center.all.each do |center|
  Schedule.create!(center: center, day: monday, opening_time: '09:00', closing_time: '12:00')
  Schedule.create!(center: center, day: tuesday, opening_time: '09:00', closing_time: '12:00')
  Schedule.create!(center: center, day: wednesday, opening_time: '09:00', closing_time: '12:00')
  Schedule.create!(center: center, day: thursday, opening_time: '09:00', closing_time: '12:00')
  Schedule.create!(center: center, day: friday, opening_time: '09:00', closing_time: '12:00')
end

puts "creating appointments"

appointment_1 = Appointment.create!({ donor_id: Donor.first.id, appointment_date: Date.today, appointment_time: Time.new(2008,6,21, 13,30,0, "+01:00"), person_in_charge: "john doe" , status: "pending", center_id: center_1.id })
appointment_2 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 1, appointment_time: Time.new(2008,6,21, 10,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_2.id })
appointment_3 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 2, appointment_time: Time.new(2008,6,21, 10,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_3.id })
appointment_4 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 3, appointment_time: Time.new(2008,6,21, 11,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_4.id })
appointment_5 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 4, appointment_time: Time.new(2008,6,21, 12,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_5.id })
appointment_6 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 5, appointment_time: Time.new(2008,6,21, 13,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_6.id })
appointment_7 = Appointment.create!({ donor_id: Donor.all.sample.id, appointment_date: Date.today + 6, appointment_time: Time.new(2008,6,21, 14,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_7.id })
appointment_8 = Appointment.create!({ donor_id: Donor.last.id, appointment_date: Date.today, appointment_time: Time.new(2008,6,21, 13,30,0, "+01:00"), person_in_charge: "john doe", status: "pending", center_id: center_8.id })

review_1 = Review.create!({ donor: Donor.first, center_id: center_1.id, rating: 4, review_content: "Great experience!" })
review_2 = Review.create!({ donor: Donor.all.sample, center_id: center_2.id, rating: 5, review_content: "Highly recommended!"})
review_3 = Review.create!({ donor: Donor.all.sample, center_id: center_3.id, rating: 3, review_content: "Easy going Nurse." })
review_4 = Review.create!({ donor: Donor.all.sample, center_id: center_4.id, rating: 2, review_content: "long waiting List" })
review_5 = Review.create!({ donor: Donor.all.sample, center_id: center_5.id, rating: 4, review_content: "Nice facilities." })
review_6 = Review.create!({ donor: Donor.all.sample, center_id: center_6.id, rating: 5, review_content: "Close to my House" })
review_7 = Review.create!({ donor: Donor.all.sample, center_id: center_7.id, rating: 3, review_content: "Freindly Staff!" })
review_8 = Review.create!({ donor: Donor.last, center_id: center_8.id, rating: 4, review_content: "Quick service!" })

puts "seeds done!"
