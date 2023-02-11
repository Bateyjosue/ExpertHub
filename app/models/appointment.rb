class Appointment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :technician, class_name: 'Technician', foreign_key: 'technician_id'

  validates :location, presence: true
  validates :date, presence: true
end
