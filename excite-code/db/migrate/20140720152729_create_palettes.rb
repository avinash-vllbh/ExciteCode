class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|

      t.timestamps
    end
  end
end
