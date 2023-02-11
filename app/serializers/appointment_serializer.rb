class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :location, :date

  belongs_to :user
  belongs_to :technician
end
