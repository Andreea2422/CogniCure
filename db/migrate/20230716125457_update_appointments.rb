class UpdateAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :doctor_id, :bigint
    add_foreign_key :appointments, :users, column: :doctor_id
  end
end
