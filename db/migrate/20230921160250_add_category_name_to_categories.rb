class AddCategoryNameToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_name, :string
  end
end
