class Player < ActiveRecord::Base
  has_many :draw_positions_players
  has_many :draw_positions, through: :draw_positions_players
  has_many :matches, through: :draw_positions
end
