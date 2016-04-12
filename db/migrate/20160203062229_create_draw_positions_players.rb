class CreateDrawPositionsPlayers < ActiveRecord::Migration
  def change
    create_table :draw_positions_players do |t|
      t.integer :draw_position_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
