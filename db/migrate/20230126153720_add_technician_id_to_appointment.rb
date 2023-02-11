class AddTechnicianIdToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :technician_id, :integer, foreign_key: true
  end
end
