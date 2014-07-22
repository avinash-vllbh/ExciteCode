class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :blog, index: true
      t.text :body, null: false
      t.string :posted_by, null: false
      t.timestamps
    end
  end
end
