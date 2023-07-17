class ReverseColumnType < ActiveRecord::Migration[7.0]
  def up
    change_column :appointments, :appointment_date, :date
  end

  def down
    change_column :appointments, :appointment_date, :timestamp
  end
end
