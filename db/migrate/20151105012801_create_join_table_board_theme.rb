class CreateJoinTableBoardTheme < ActiveRecord::Migration
  def change
    create_join_table :boards, :themes do |t|
      # t.index [:board_id, :theme_id]
      # t.index [:theme_id, :board_id]
    end
  end
end
