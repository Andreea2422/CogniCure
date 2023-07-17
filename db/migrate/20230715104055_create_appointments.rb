class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :patient
      t.date :appointment_date
      t.string :doctor

      t.timestamps
    end
  end
end
