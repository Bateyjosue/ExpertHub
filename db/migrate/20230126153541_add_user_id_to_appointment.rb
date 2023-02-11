class AddUserIdToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :user_id, :integer, foreign_key: true
  end
end
