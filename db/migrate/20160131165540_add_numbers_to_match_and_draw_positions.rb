class AddNumbersToMatchAndDrawPositions < ActiveRecord::Migration
  def change
    add_column :matches, :match_number, :integer
    add_column :draw_positions, :draw_positions_number, :integer
  end
end
