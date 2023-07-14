class AddForeignKeyArticlesUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :bigint
    add_foreign_key :articles, :users, column: :user_id
  end
end
