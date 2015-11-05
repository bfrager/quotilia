class AddIndexToTable < ActiveRecord::Migration
  def change
    add_index :quote, :creator_id
  end
end
