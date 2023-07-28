class CreateSituationChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :situation_choices do |t|
      t.references :situation, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true
      t.boolean :outcome

      t.timestamps
    end
  end
end
