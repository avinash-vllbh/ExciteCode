class AddSlugColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string, null: false, unique: true
  end
end
