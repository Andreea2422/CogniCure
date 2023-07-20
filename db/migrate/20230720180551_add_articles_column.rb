class AddArticlesColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :keywords, :string, array: true, default: []
  end
end
