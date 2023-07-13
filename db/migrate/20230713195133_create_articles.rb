class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :cover_image
      t.date :publish_date
      t.string :readtime

      t.timestamps
    end
  end
end
