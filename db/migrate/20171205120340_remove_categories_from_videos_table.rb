class RemoveCategoriesFromVideosTable < ActiveRecord::Migration
  def change
    remove_column :videos, :category
  end
end
