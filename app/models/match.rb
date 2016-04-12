class Match < ActiveRecord::Base
  has_many :draw_positions
  has_many :draw_positions_players, through: :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw

  attr_accessor :player_options

  def winner
    Player.find_by(id: self.winner_id)
  end

  def loser
    Player.find_by(id: self.loser_id)
  end

  def calculate_loser
    loser = self.players.select { |player| player.id != self.winner_id }
    self.loser_id = loser[0].id
  end

  def update_winner_and_loser(winner:, player_options:)
    self.winner_id = winner.id
    data = JSON.parse(player_options)

    if winner.id == data.first['id']
      self.loser_id = data.last['id']
    else
      self.loser_id = data.first['id']
    end
    self.save
  end

  def update_score(score)
    self.score = score
    self.save
  end

  def display_previous_match_score(draw_position)
    begin
      match = Draw.previous_match(draw_position: draw_position)
      match.score.nil? ? "-" : match.score
    rescue NoMethodError
      return ""
    end
  end

  def display_time
    begin
      self.time.strftime(("%-I:%M"))
    rescue NoMethodError
      "?"
    end
  end

  def display_location
    begin
      self.location.short_letters
    rescue
      "?"
    end
  end

  def has_two_players?
    self.players.count == 2
  end

  def has_only_one_player?
    self.players.count == 1
  end

  def has_adjacent_players?
    Draw.match_has_adjacent_players?(self.draw_positions.first) && Draw.match_has_adjacent_players?(self.draw_positions.last)
  end

  def no_players_are_nil?
    self.draw_positions.first.players.last == nil && self.draw_positions.last.players.last == nil
  end

  def top_player_is_nil?
    self.draw_positions.first.players.empty?
  end

  def bottom_player_is_nil?
    self.draw_positions.last.players.empty?
  end

  def self.round(round_name)
    Match.where(name: "#{round_name}")
  end
end
