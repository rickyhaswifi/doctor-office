# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

reason = ['Has Cold','Perscription Refil','Broken Arm','Has Allergies','Fainted after learning vanilla JS','Has flu']

10.times do 
    physician = Physician.create(
      name: Faker::FunnyName.name,
      specialty: Faker::Kpop.boy_bands
    )
  
    10.times do
      patient = Patient.create(
        name: Faker::FunnyName.name,
        age: Faker::Number.between(from: 18, to: 74),
        phone_number: Faker::PhoneNumber.cell_phone,
        reason: reason.sample
      )
     
      Appointment.create(
        date: Faker::Date.between(from: 2.days.ago, to: Date.today),
        time: reason.sample,
        physician_id: physician.id,
        patient_id: patient.id
      )
    end
  end
  
  puts 'Data seeded.'

  