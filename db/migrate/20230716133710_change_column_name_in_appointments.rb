class ChangeColumnNameInAppointments < ActiveRecord::Migration[7.0]
  def change
    rename_column :appointments, :doctor, :doctor_name
  end
end
