class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.integer :likes
      t.integer :posts_count

      t.timestamps null: false
    end
  end
end
