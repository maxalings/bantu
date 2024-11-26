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
house_cleaning_service = Service.create!(title: "House Cleaning", category: "House Cleaning Services", price: 1.5, description: "tidy up and clean households", user_id: sugi.id)
massage_service = Service.create!(title: "Massage", category: "Massage and Wellness", price: 3.5, description: "Personal massage", user_id: sugi.id)
plant_care_service = Service.create!(title: "Plant care", category: "Gardening and Landscaping", price: 0.5, description: "Water household plants", user_id: max.id)

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
  { title: "Pool Renovation", category: "Pool Cleaning and Maintenance", price: 300.0, description: "Complete pool renovation and repairs", user_id: max.id }
]

services_data.each do |service_data|
  Service.create!(service_data)
end

puts "Creating sample requests..."
Request.create!(status: "accepted", date: "2025-11-26", duration: 2.5, description: "Walk my dog for 2.5hr in the morning.", service_id: house_cleaning_service.id, user_id: sugi.id)
Request.create!(status: "declined", date: "2025-12-05", duration: 1.5, description: "Clean my house this Friday.", service_id: massage_service.id, user_id: max.id)
Request.create!(status: "pending", date: "2025-12-21", duration: 0.5, description: "Water my flowers", service_id: plant_care_service.id, user_id: sugi.id)
