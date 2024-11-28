class Service < ApplicationRecord
  belongs_to :user
  has_many :requests

  CATEGORIES = [
    "Appliance Installation and Repair",
    "Babysitting and Childcare",
    "Car Detailing and Maintenance",
    "Catering and Cooking Services",
    "Dog Walking and Training",
    "Electric and Plumbing",
    "Event Services",
    "Financial Planning and Tax Assistance",
    "Gardening and Landscaping",
    "Health Coaching and Nutrition Guidance",
    "Home Repair and Handyman Services",
    "House Cleaning Services",
    "Interior Design and Home Staging",
    "Laundry and Dry Cleaning",
    "Legal and Notary Services",
    "Massage and Wellness",
    "Moving and Packing Services",
    "Music and Art Lessons",
    "Personal Fitness Training",
    "Pet Care Services",
    "Photography and Videography",
    "Pool Cleaning and Maintenance",
    "Private Tutoring and Education",
    "Roofing and Gutter Services",
    "Security and Surveillance Installation",
    "Senior Care and Assistance",
    "Sewing and Alterations",
    "Tech Support and IT Services",
    "Transportation and Driver Services",
    "Waste Removal and Junk Hauling",
    "Window Cleaning"
  ]

  validates :title, :price, :category, :address, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 1500 }
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid status" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
