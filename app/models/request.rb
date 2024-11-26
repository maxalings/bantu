class Request < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, :duration, :date, :description, presence: true
  # validates :status, { in: %w[accepted declined pending],
  #   message: "%{value} is not a valid status" }
end
