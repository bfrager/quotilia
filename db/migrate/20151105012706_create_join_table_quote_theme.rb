class CreateJoinTableQuoteTheme < ActiveRecord::Migration
  def change
    create_join_table :quotes, :themes do |t|
      # t.index [:quote_id, :theme_id]
      # t.index [:theme_id, :quote_id]
    end
  end
end
