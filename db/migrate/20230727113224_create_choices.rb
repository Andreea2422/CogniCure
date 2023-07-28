class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :name
      t.string :choice_text
      t.integer :id_mood

      t.timestamps
    end
  end
end
