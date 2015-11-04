class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :tag

      t.timestamps null: false
    end
  end
end
