class AddCreatorToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :creator, index: true, foreign_key: true
  end
end
