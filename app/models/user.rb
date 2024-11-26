class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :services
  has_many :requests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :phone_number, :numericality => true, :length => { :minimum => 8, :maximum => 15, :message => "The phone number should be numerical, only between 8 & 15 figures" }

end
