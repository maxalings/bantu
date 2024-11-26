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
sugi = User.create!(email: "sugi@bantu.com", password: "1234567")
max = User.create!(email: "max@bantu.com", password: "12345678")

puts "Creating sample services..."
house_cleaning_service = Service.create!(title: "House Cleaning", category: "House Cleaning Services", price: 1.5, description: "tidy up and clean households", user_id: sugi.id)
massage_service = Service.create!(title: "Massage", category: "Massage and Wellness", price: 3.5, description: "Personal massage", user_id: sugi.id)
plant_care_service = Service.create!(title: "Plant care", category: "Gardening and Landscaping", price: 0.5, description: "Water houehold plants", user_id: max.id)

# status = ["accepted", "declined", "pending"]
puts "Creating sample requests..."
Request.create!(status: "accepted", date: "2025-11-26", duration: 2.5, description: "Walk my dog for 2.5hr in the morning.", service_id: house_cleaning_service.id, user_id: sugi.id)
Request.create!(status: "declined", date: "2025-12-05", duration: 1.5, description: "Clean my house this Friday.", service_id: massage_service.id, user_id: max.id)
Request.create!(status: "pending", date: "2025-12-21", duration: 0.5, description: "Water my flowers", service_id: plant_care_service.id, user_id: sugi.id)
