require 'faker' 

# Création 100 fake villes

15.times do
  city = City.create!(city: Faker::Address.city)
end

# Création de 100 fake patients
50.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)   
end

# Création de 30 fakes docteurs
25.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zipcode: Faker::Address.zip_code, city: City.all.sample)   
end

# Création 100 fake RDV
#100.times do
#  appointment = Appointment.create!(date: Faker::Time.forward(days: 150, period: :day), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
#end

# Création de 30 fakes RDV où la appointment.city == doctor.city == patient.city
30.times do
  n = rand(1..City.all.count)
  appointment = Appointment.create
  appointment.date = Faker::Time.forward(days: rand(1..365), period: :day, format: :long)
  appointment.city_id = n
  what_doc = Doctor.where("city_id like ?", "%#{appointment.city_id}%")
  appointment.doctor = what_doc.sample
  what_pat = Patient.where("city_id like ?", "%#{appointment.city_id}%")
  appointment.patient = what_pat.sample
  appointment.save
end

# Création 16 spécialités (à lancer une seule fois)
#specialties_array = ["Dentist", "General Practitioner", "Immunologist", "Cardiologist", "Dermatologist", "Gastroenterologist", "Podiatrist", "Pediatrician", "Endocrinologist", "Neurologist", "Rheumatologist", "Psychiatrist", "Gynecologist", "Surgeon", "Ophthalmologist", "Urologist"]
#specialties_array.each do |s|
#  Specialty.create!(specialty_name: s)
#end

# Création lien spécialités docteur
30.times do
  specialty_doctor = SpecialtyDoctor.create!(doctor: Doctor.all.sample, specialty: Specialty.all.sample)
end


