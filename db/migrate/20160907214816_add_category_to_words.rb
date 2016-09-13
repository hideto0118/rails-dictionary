class AddCategoryToWords < ActiveRecord::Migration
  def change
    add_column :words, :category, :integer
  end
end
