class Technician < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :location, presence: true
  validates :charges, presence: true
  validates :specialization, presence: true
  validates :image, presence: true
end
