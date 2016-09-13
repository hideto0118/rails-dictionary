class RemoveCategoryFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :category, :integer
  end
end
