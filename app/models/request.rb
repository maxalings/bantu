class Request < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, :duration, :date, :description, presence: true

end
