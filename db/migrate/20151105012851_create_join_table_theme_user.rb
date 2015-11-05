class CreateJoinTableThemeUser < ActiveRecord::Migration
  def change
    create_join_table :themes, :users do |t|
      # t.index [:theme_id, :user_id]
      # t.index [:user_id, :theme_id]
    end
  end
end
