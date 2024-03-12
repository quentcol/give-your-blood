# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Appointment.delete_all
Schedule.delete_all
Center.delete_all
Hospital.delete_all
Donor.delete_all
User.delete_all
Day.delete_all

puts "creating users"
user_1 = User.create!({ email: 'host-a@host.com', password: 'password123', category: 'donor' })
user_2 = User.create!({ email: 'host-b1@host.com', password: 'password12', category: 'donor' })
user_3 = User.create!({ email: 'host-b2@host.com', password: 'password1234', category: 'hospital' })

puts "creating donors"
donor_1 = { user: user_1, first_name: 'Iheb', last_name: "Laib", blood_type: 'A+', address: 'New York', birthdate: '1995-01-01' }
donor_2 = { user: user_2, first_name: 'Mahmoud', last_name: "Moursay", blood_type: 'B+', address: 'Los Angeles', birthdate: '1990-01-01' }
donor_3 = { user: user_3, first_name: 'Robin', last_name: "Gerritsen", blood_type: 'O+', address: 'Chicago', birthdate: '1992-01-01' }

[donor_1, donor_2, donor_3].each do |info|
  donor = Donor.create!(info)
  puts "created #{donor.first_name}"
end

puts "creating hospitals"
hospital_1 = Hospital.create!({ user: user_1, hospital_name: 'General Hospital' })
hospital_2 = Hospital.create!({ user: user_2, hospital_name: 'Children Hospital' })
hospital_3 = Hospital.create!({ user: user_3, hospital_name: 'Veterans Hospital' })

puts "creating centers"
center_1 = Center.create!({ hospital: hospital_1, name: 'Blood Center 1', address: 'New York' })
center_2 = Center.create!({ hospital: hospital_2, name: 'Blood Center 2', address: 'Los Angeles' })
center_3 = Center.create!({ hospital: hospital_3, name: 'Blood Center 3', address: 'Chicago' })

puts "creating days"
weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday]

weekdays.each do |day_name|

  Day.create!(name: day_name)
end

puts "creating schedules"
schedules_1 = Schedule.create!({ center_id: Center.first.id, day: Day.first, opening_time: '09:00', closing_time: '12:00' })
schedules_2 = Schedule.create!({ center_id: Center.second.id, day: Day.second, opening_time: '09:00', closing_time: '12:00' })
schedules_3 = Schedule.create!({ center_id: Center.third.id, day: Day.third, opening_time: '09:00', closing_time: '12:00' })

puts "creating appointments"
appointment_1 = Appointment.create!({ donor_id: Donor.first.id, center_id: center_1.id })
appointment_2 = Appointment.create!({ donor_id: Donor.second.id, center_id: center_2.id })
appointment_3 = Appointment.create!({ donor_id: Donor.third.id, center_id: center_3.id })

puts "seeds done!"
