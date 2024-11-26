class Request < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, :duration, :date, :description, presence: true
  validates :status, inclusion: { in: %w[accepted declined pending], message: "%{value} is not a valid status" }
  validates :duration, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1500 }
end
