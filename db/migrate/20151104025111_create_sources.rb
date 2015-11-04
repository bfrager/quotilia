class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :type
      t.date :date
      t.string :publisher
      t.string :edition
      t.string :section
      t.string :link

      t.timestamps null: false
    end
  end
end
