class Service < ApplicationRecord
  belongs_to :user

  CATEGORIES = [
    "Pool Cleaning and Maintenance",
    "Massage and Wellness",
    "Gardening and Landscaping",
    "House Cleaning Services",
    "Pet Care Services",
    "Home Repair and Handyman Services",
    "Car Detailing and Maintenance",
    "Personal Fitness Training",
    "Event Services",
    "Appliance Installation and Repair"
  ]

  validates :title, :price, :category, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 1500 }
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid status" }
end
