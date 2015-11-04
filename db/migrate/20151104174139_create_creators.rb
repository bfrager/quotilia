class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :name
      t.string :nationality
      t.string :born
      t.string :died

      t.timestamps null: false
    end
  end
end
