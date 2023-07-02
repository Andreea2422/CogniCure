class CreateMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :moods do |t|
      t.string :mood
      t.date :day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
