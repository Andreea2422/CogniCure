class ChangeDefaultForColumnInArticles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :articles, :keywords, nil
  end
end
