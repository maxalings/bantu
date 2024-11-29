class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :service_id, uniqueness: { scope: :user_id }
end
