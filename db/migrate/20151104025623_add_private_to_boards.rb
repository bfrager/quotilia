class AddPrivateToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :private, :boolean
  end
end
