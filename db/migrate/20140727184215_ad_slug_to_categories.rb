class AdSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string, null: false, unique: true
    add_index :categories, :slug
  end
end
