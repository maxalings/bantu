# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Request.destroy_all
Service.destroy_all
User.destroy_all

puts "Creating sample users..."
sugi = User.create!(email: "sugi@bantu.com", password: "1234567", first_name: "Sugi", last_name: "Henson", phone_number: "1234567890")
max = User.create!(email: "max@bantu.com", password: "12345678", first_name: "Max", last_name: "Alings", phone_number: "1234567890")

puts "Creating sample services..."
house_cleaning_service = Service.create!(
  title: "Thorough House Cleaning for a Sparkling Home",
  category: "House Cleaning Services",
  price: 1.5,
  description: "Deep cleaning for households, including dusting, vacuuming, and mopping. Perfect for a fresh start.",
  user_id: sugi.id
)

massage_service = Service.create!(
  title: "Relaxing Massage for Stress Relief and Wellness",
  category: "Massage and Wellness",
  price: 3.5,
  description: "Personalized massage sessions to relieve tension and improve overall well-being in the comfort of your home.",
  user_id: sugi.id
)

plant_care_service = Service.create!(
  title: "Plant Care and Watering for Thriving Greenery",
  category: "Gardening and Landscaping",
  price: 0.5,
  description: "Water and care for your household or garden plants to keep them healthy and vibrant.",
  user_id: max.id
)

# Additional services
services_data = [
  { title: "Pool Maintenance Weekly", category: "Pool Cleaning and Maintenance", price: 45.0, description: "Weekly pool cleaning and chemical balance check", user_id: sugi.id },
  { title: "Deep Tissue Massage", category: "Massage and Wellness", price: 75.0, description: "Professional deep tissue massage therapy", user_id: max.id },
  { title: "Lawn Mowing Service", category: "Gardening and Landscaping", price: 35.0, description: "Regular lawn maintenance and trimming", user_id: sugi.id },
  { title: "Deep House Cleaning", category: "House Cleaning Services", price: 120.0, description: "Thorough house cleaning including windows and carpets", user_id: max.id },
  { title: "Dog Walking", category: "Pet Care Services", price: 20.0, description: "30-minute dog walking service", user_id: sugi.id },
  { title: "Plumbing Repair", category: "Home Repair and Handyman Services", price: 85.0, description: "Basic plumbing repairs and maintenance", user_id: max.id },
  { title: "Premium Car Wash", category: "Car Detailing and Maintenance", price: 50.0, description: "Complete car wash and wax service", user_id: sugi.id },
  { title: "Personal Training Session", category: "Personal Fitness Training", price: 60.0, description: "One-on-one fitness training", user_id: max.id },
  { title: "Birthday Party Planning", category: "Event Services", price: 200.0, description: "Complete birthday party planning and coordination", user_id: sugi.id },
  { title: "Dishwasher Installation", category: "Appliance Installation and Repair", price: 95.0, description: "Professional dishwasher installation", user_id: max.id },
  { title: "Hot Stone Massage", category: "Massage and Wellness", price: 90.0, description: "Relaxing hot stone massage therapy", user_id: sugi.id },
  { title: "Garden Design", category: "Gardening and Landscaping", price: 150.0, description: "Professional garden design and planning", user_id: max.id },
  { title: "Pet Sitting", category: "Pet Care Services", price: 40.0, description: "In-home pet sitting services", user_id: sugi.id },
  { title: "Furniture Assembly", category: "Home Repair and Handyman Services", price: 55.0, description: "Assembly of furniture and installations", user_id: max.id },
  { title: "Engine Detailing", category: "Car Detailing and Maintenance", price: 75.0, description: "Detailed engine cleaning and maintenance", user_id: sugi.id },
  { title: "Wedding Planning", category: "Event Services", price: 500.0, description: "Comprehensive wedding planning services", user_id: max.id },
  { title: "AC Repair", category: "Appliance Installation and Repair", price: 120.0, description: "Air conditioning repair and maintenance", user_id: sugi.id },
  { title: "HIIT Training", category: "Personal Fitness Training", price: 45.0, description: "High-intensity interval training sessions", user_id: max.id },
  { title: "Window Cleaning", category: "House Cleaning Services", price: 80.0, description: "Professional window cleaning service", user_id: sugi.id },
  { title: "Pool Renovation", category: "Pool Cleaning and Maintenance", price: 300.0, description: "Complete pool renovation and repairs", user_id: max.id },
  { title: "Home Staging Consultation", category: "Interior Design and Home Staging", price: 150.0, description: "Professional home staging for real estate", user_id: sugi.id },
  { title: "Room Design Package", category: "Interior Design and Home Staging", price: 250.0, description: "Complete room design and layout planning", user_id: max.id },
  { title: "Color Consultation", category: "Interior Design and Home Staging", price: 75.0, description: "Expert color scheme planning for your space", user_id: sugi.id },
  { title: "Weekly Meal Prep", category: "Catering and Cooking Services", price: 120.0, description: "Healthy meal preparation for the week", user_id: max.id },
  { title: "Party Catering", category: "Catering and Cooking Services", price: 300.0, description: "Full-service party catering", user_id: sugi.id },
  { title: "Personal Chef Service", category: "Catering and Cooking Services", price: 200.0, description: "Private chef cooking experience", user_id: max.id },
  { title: "Evening Babysitting", category: "Babysitting and Childcare", price: 25.0, description: "Reliable evening childcare", user_id: sugi.id },
  { title: "Weekend Childcare", category: "Babysitting and Childcare", price: 150.0, description: "Full weekend childcare service", user_id: max.id },
  { title: "After School Care", category: "Babysitting and Childcare", price: 35.0, description: "After school supervision and activities", user_id: sugi.id },
  { title: "Senior Companion Care", category: "Senior Care and Assistance", price: 30.0, description: "Companionship and basic assistance for seniors", user_id: max.id },
  { title: "Medical Appointment Transport", category: "Senior Care and Assistance", price: 45.0, description: "Transportation to medical appointments", user_id: sugi.id },
  { title: "Daily Senior Assistant", category: "Senior Care and Assistance", price: 40.0, description: "Help with daily activities and errands", user_id: max.id },
  { title: "Computer Repair", category: "Tech Support and IT Services", price: 85.0, description: "PC and laptop repair services", user_id: sugi.id },
  { title: "Smart Home Setup", category: "Tech Support and IT Services", price: 120.0, description: "Complete smart home device installation", user_id: max.id },
  { title: "Data Recovery", category: "Tech Support and IT Services", price: 150.0, description: "Professional data recovery service", user_id: sugi.id },
  { title: "Math Tutoring", category: "Private Tutoring and Education", price: 45.0, description: "One-on-one math tutoring", user_id: max.id },
  { title: "Language Lessons", category: "Private Tutoring and Education", price: 40.0, description: "Private language instruction", user_id: sugi.id },
  { title: "Test Prep Tutoring", category: "Private Tutoring and Education", price: 55.0, description: "SAT/ACT test preparation", user_id: max.id },
  { title: "Portrait Photography", category: "Photography and Videography", price: 200.0, description: "Professional portrait photo session", user_id: sugi.id },
  { title: "Event Photography", category: "Photography and Videography", price: 350.0, description: "Complete event photo coverage", user_id: max.id },
  { title: "Product Photography", category: "Photography and Videography", price: 150.0, description: "Commercial product photography", user_id: sugi.id },
  { title: "Piano Lessons", category: "Music and Art Lessons", price: 50.0, description: "Private piano instruction", user_id: max.id },
  { title: "Painting Classes", category: "Music and Art Lessons", price: 45.0, description: "Individual painting instruction", user_id: sugi.id },
  { title: "Guitar Lessons", category: "Music and Art Lessons", price: 40.0, description: "Beginner to advanced guitar lessons", user_id: max.id },
  { title: "Local Moving", category: "Moving and Packing Services", price: 150.0, description: "Local moving assistance", user_id: sugi.id },
  { title: "Packing Service", category: "Moving and Packing Services", price: 80.0, description: "Professional packing service", user_id: max.id },
  { title: "Furniture Moving", category: "Moving and Packing Services", price: 120.0, description: "Heavy furniture moving service", user_id: sugi.id },
  { title: "Clothing Alterations", category: "Sewing and Alterations", price: 35.0, description: "Professional clothing alterations", user_id: max.id },
  { title: "Custom Dressmaking", category: "Sewing and Alterations", price: 200.0, description: "Custom dress creation", user_id: sugi.id },
  { title: "Quick Repairs", category: "Sewing and Alterations", price: 25.0, description: "Quick clothing repairs and fixes", user_id: max.id },
  { title: "Junk Removal", category: "Waste Removal and Junk Hauling", price: 150.0, description: "Complete junk removal service", user_id: sugi.id },
  { title: "Construction Cleanup", category: "Waste Removal and Junk Hauling", price: 200.0, description: "Construction site cleanup", user_id: max.id },
  { title: "Yard Waste Removal", category: "Waste Removal and Junk Hauling", price: 100.0, description: "Garden and yard waste removal", user_id: sugi.id },
  { title: "Roof Inspection", category: "Roofing and Gutter Services", price: 100.0, description: "Comprehensive roof inspection", user_id: max.id },
  { title: "Gutter Cleaning", category: "Roofing and Gutter Services", price: 80.0, description: "Professional gutter cleaning", user_id: sugi.id },
  { title: "Roof Repair", category: "Roofing and Gutter Services", price: 250.0, description: "Roof repair and maintenance", user_id: max.id },
  { title: "Camera Installation", category: "Security and Surveillance Installation", price: 200.0, description: "Security camera system installation", user_id: sugi.id },
  { title: "Alarm System Setup", category: "Security and Surveillance Installation", price: 250.0, description: "Home alarm system installation", user_id: max.id },
  { title: "Security Assessment", category: "Security and Surveillance Installation", price: 100.0, description: "Home security evaluation", user_id: sugi.id },
  { title: "Airport Transfer", category: "Transportation and Driver Services", price: 60.0, description: "Airport pickup and dropoff service", user_id: max.id },
  { title: "Event Transportation", category: "Transportation and Driver Services", price: 80.0, description: "Special event transportation", user_id: sugi.id },
  { title: "Personal Driver", category: "Transportation and Driver Services", price: 45.0, description: "Hourly personal driver service", user_id: max.id },
  { title: "Notary Service", category: "Legal and Notary Services", price: 50.0, description: "Mobile notary services", user_id: sugi.id },
  { title: "Document Review", category: "Legal and Notary Services", price: 75.0, description: "Basic legal document review", user_id: max.id },
  { title: "Contract Preparation", category: "Legal and Notary Services", price: 150.0, description: "Basic contract preparation service", user_id: sugi.id },
  { title: "Tax Preparation", category: "Financial Planning and Tax Assistance", price: 200.0, description: "Personal tax return preparation", user_id: max.id },
  { title: "Financial Planning", category: "Financial Planning and Tax Assistance", price: 150.0, description: "Basic financial planning consultation", user_id: sugi.id },
  { title: "Bookkeeping", category: "Financial Planning and Tax Assistance", price: 80.0, description: "Basic bookkeeping services", user_id: max.id },
  { title: "Nutrition Planning", category: "Health Coaching and Nutrition Guidance", price: 75.0, description: "Personalized nutrition planning", user_id: sugi.id },
  { title: "Wellness Coaching", category: "Health Coaching and Nutrition Guidance", price: 90.0, description: "Holistic wellness coaching", user_id: max.id },
  { title: "Meal Planning", category: "Health Coaching and Nutrition Guidance", price: 60.0, description: "Custom meal plan creation", user_id: sugi.id },
  { title: "Basic Dog Training", category: "Dog Walking and Training", price: 65.0, description: "Basic obedience training", user_id: max.id },
  { title: "Puppy Training", category: "Dog Walking and Training", price: 75.0, description: "Puppy socialization and training", user_id: sugi.id },
  { title: "Behavior Correction", category: "Dog Walking and Training", price: 85.0, description: "Specialized behavior correction", user_id: max.id },
  { title: "Wash and Fold Service", category: "Laundry and Dry Cleaning", price: 25.0, description: "Per-load wash and fold laundry service", user_id: sugi.id },
  { title: "Dry Cleaning", category: "Laundry and Dry Cleaning", price: 15.0, description: "Professional dry cleaning service per item", user_id: max.id },
  { title: "Shirt Service", category: "Laundry and Dry Cleaning", price: 8.0, description: "Professional shirt laundering and pressing", user_id: sugi.id },
  { title: "Bedding and Linens", category: "Laundry and Dry Cleaning", price: 35.0, description: "Cleaning service for bedding and linens", user_id: max.id },
  { title: "Same-Day Service", category: "Laundry and Dry Cleaning", price: 40.0, description: "Express same-day laundry service", user_id: sugi.id },
  # Electric and Plumbing Services
  { title: "Electrical Inspection", category: "Electric and Plumbing", price: 120.0, description: "Comprehensive electrical system inspection", user_id: max.id },
  { title: "Light Fixture Installation", category: "Electric and Plumbing", price: 85.0, description: "Professional light fixture mounting and wiring", user_id: sugi.id },
  { title: "Emergency Electrical", category: "Electric and Plumbing", price: 200.0, description: "24/7 emergency electrical service", user_id: max.id },
  { title: "Drain Cleaning", category: "Electric and Plumbing", price: 120.0, description: "Professional drain cleaning and unclogging", user_id: sugi.id },
  { title: "Water Heater Service", category: "Electric and Plumbing", price: 180.0, description: "Water heater maintenance and repair", user_id: max.id }
]

services_data.each do |service_data|
  Service.create!(service_data)
end

puts "Creating sample requests..."
Request.create!(status: "accepted", date: "2025-11-26", duration: 2.5, description: "Walk my dog for 2.5hr in the morning.", service_id: house_cleaning_service.id, user_id: sugi.id)
Request.create!(status: "declined", date: "2025-12-05", duration: 1.5, description: "Clean my house this Friday.", service_id: massage_service.id, user_id: max.id)
Request.create!(status: "pending", date: "2025-12-21", duration: 0.5, description: "Water my flowers", service_id: plant_care_service.id, user_id: sugi.id)
