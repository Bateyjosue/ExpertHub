class CreateTechnicians < ActiveRecord::Migration[7.0]
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :location
      t.float :charges
      t.string :specialization
      t.string :image

      t.timestamps
    end
  end
end
