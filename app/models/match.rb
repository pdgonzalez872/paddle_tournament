class Match < ActiveRecord::Base
  has_many :draw_positions
  has_many :draw_positions_players, through: :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw

  attr_accessor :player_options

  def winner
    Player.find_by(id: winner_id)
  end

  def loser
    Player.find_by(id: loser_id)
  end

  def update_winner_and_loser(winner:, player_options:)
    self.winner_id = winner.id
    data = JSON.parse(player_options)

    self.loser_id = if winner.id == data.first['id']
                      data.last['id']
                    else
                      data.first['id']
                    end
    save
  end

  def update_score(score)
    self.score = score
    save
  end

  def display_previous_match_score(draw_position)
    match = Draw.previous_match(draw_position: draw_position)
    match.score.nil? ? '-' : match.score
  rescue NoMethodError
    return ''
  end

  def display_time
    time.strftime('%-I:%M')
  rescue NoMethodError
    '?'
  end

  def display_location
    location.short_letters
  rescue
    '?'
  end

  def has_two_players?
    players.count == 2
  end

  def has_only_one_player?
    players.count == 1
  end

  def has_adjacent_players?
    Draw.match_has_adjacent_players?(draw_positions.first) && Draw.match_has_adjacent_players?(draw_positions.last)
  end

  def no_players_are_nil?
    draw_positions.first.players.last.nil? && draw_positions.last.players.last.nil?
  end

  def top_player_is_nil?
    draw_positions.first.players.empty?
  end

  def bottom_player_is_nil?
    draw_positions.last.players.empty?
  end

  def self.round(round_name)
    Match.where(name: round_name.to_s)
  end
end
