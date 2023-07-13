class AddContentQuoteToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :content, :text
    add_column :articles, :quote, :string
  end
end
