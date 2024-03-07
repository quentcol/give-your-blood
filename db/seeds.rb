# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

donors = [
  { name: 'Iheb Laib', blood_type: 'A+', age: 25 },
  { name: 'Mahmoud Moursay', blood_type: 'B-', age: 30 },
  { name: 'Quentin Collet', blood_type: 'O+', age: 25 },
  { name: 'Robin Gerritsen', blood_type: 'AB-', age: 25 }
]
Donor.create(donors)

hospitals = [
  { name: 'General Hospital', location: 'New York' },
  { name: 'City Medical Center', location: 'Los Angeles' },
  { name: 'Central Hospital', location: 'Chicago' }
]
Hospital.create(hospitals)

centers = [
  { name: 'Blood Center 1', location: 'New York' },
  { name: 'Blood Center 2', location: 'Los Angeles' },
  { name: 'Blood Center 3', location: 'Chicago' }
]
Center.create(centers)

schedules = [
  { center_id: Center.first.id, day: 'Monday', start_time: '09:00', end_time: '12:00' },
  { center_id: Center.first.id, day: 'Tuesday', start_time: '13:00', end_time: '16:00' },
  { center_id: Center.second.id, day: 'Wednesday', start_time: '10:00', end_time: '13:00' }
]
Schedule.create(schedules)

appointments = [
  { donor_id: Donor.first.id, schedule_id: Schedule.first.id },
  { donor_id: Donor.second.id, schedule_id: Schedule.second.id },
  { donor_id: Donor.third.id, schedule_id: Schedule.third.id },
  { donor_id: Donor.fourth.id, schedule_id: Schedule.first.id }
]
Appointment.create(appointments)


weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday]

# Iterate over each weekday and create a corresponding record in the 'days' table
weekdays.each do |day_name|
  Day.create(name: day_name)
end

