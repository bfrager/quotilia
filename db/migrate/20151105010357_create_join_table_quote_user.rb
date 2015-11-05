class CreateJoinTableQuoteUser < ActiveRecord::Migration
  def change
    create_join_table :quotes, :users do |t|
      # t.index [:quote_id, :user_id]
      # t.index [:user_id, :quote_id]
    end
  end
end
