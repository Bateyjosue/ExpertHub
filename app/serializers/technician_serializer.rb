class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :charges, :specialization, :image

  has_many :appointments
end
