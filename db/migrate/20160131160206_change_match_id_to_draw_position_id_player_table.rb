class ChangeMatchIdToDrawPositionIdPlayerTable < ActiveRecord::Migration
  def change
    remove_column :players, :match_id
    add_column :players, :draw_position_id, :integer
  end
end
