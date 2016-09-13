class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :sentence
      t.text :description
      t.integer :level

      t.timestamps null: false
    end
  end
end
