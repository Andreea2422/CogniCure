class DeleteCoverImageColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :cover_image
  end
end
