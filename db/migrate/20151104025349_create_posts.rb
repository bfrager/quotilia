class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :background
      t.string :stylesheet
      t.string :file_type
      t.references :user, index: true, foreign_key: true
      t.string :repost_from

      t.timestamps null: false
    end
  end
end
