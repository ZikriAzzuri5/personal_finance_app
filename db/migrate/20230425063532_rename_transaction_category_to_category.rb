class RenameCategoryToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :categories
  end
end
