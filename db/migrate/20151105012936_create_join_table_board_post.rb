class CreateJoinTableBoardPost < ActiveRecord::Migration
  def change
    create_join_table :boards, :posts do |t|
      # t.index [:board_id, :post_id]
      # t.index [:post_id, :board_id]
    end
  end
end
