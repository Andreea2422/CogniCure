class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.references :user, null: false, foreign_key: true
      t.text :biography
      t.string :speciality, array: true, default: []
      t.string :experience
      t.string :contact, array: true, default: []

      t.timestamps
    end
  end
end
