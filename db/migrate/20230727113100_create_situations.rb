class CreateSituations < ActiveRecord::Migration[7.0]
  def change
    create_table :situations do |t|
      t.string :name
      t.string :story_text
      t.integer :id_mood

      t.timestamps
    end
  end
end
