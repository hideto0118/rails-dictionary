class AddCategoryFromWords < ActiveRecord::Migration
  def change
    add_column :words, :category, :string
  end
end
