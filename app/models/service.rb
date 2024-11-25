class Service < ApplicationRecord
  belongs_to :user

  validates :title, :price, :category, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 1500 }
end
