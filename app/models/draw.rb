class Draw < ActiveRecord::Base

  # attr_accessor :complete?

  after_create :create_draw_structure

  has_many :matches
  has_many :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :tournament

  def self.match_has_adjacent_players?(draw_position)
    dp1 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2).players.first.nil?
    dp2 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2 + 1).players.first.nil?

    if dp1 && dp2
      return false
    end
    true
  end

  # TODO Refactor Draw.match_has_adjacent_players?(match.draw_positions.first) || Draw.match_has_adjacent_players?(match.draw_positions.last) %>
  # def self.match_needs_winner?(match)
  #   self.match_has_adjacent_players()
  # end

  def self.fetch_player_options(draw_position)
    player_options = {
        player1: DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2).players.first,
        player2: DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2 + 1).players.first }
  end

  def self.finals?(draw)
    m = self.matches.find_by(name: "final")
    # if m
  end

  def self.previous_match(draw_position:)
    draw = draw_position.draw
    match = draw.matches.find_by(match_number: draw_position.draw_positions_number)
  end

  # TODO
  def self.ongoing_matches(draw)
    # get all the non-complete matches.
  end

  private

  def draw_positions_count
      (2 * self.size) - 1
  end

  def create_draw_positions
    draw_positions_count.times do |d|
      dp = DrawPosition.new
      self.draw_positions << dp
    end
  end

  def matches_count
    self.size - 1
  end

  def create_draw_structure
    rounds = { "champion"   => 1,
               "final"      => (2..3),
               "semis"      => (4..7),
               "quarters"   => (8..15),
               "oitavas"    => (16..31),
               "sixty_four" => (32..63) }

    rounds.each do |k,v|
      if k == "champion"
        create_champion_position
      else
        if self.size >= v.to_a[0]
          create_matches_and_draw_positions(rounds["#{k}"], "#{k}")
        else
          return
        end
      end
    end
  end

  def create_matches_and_draw_positions(starting_point, name)
    starting_point.each do |t|
      # p "t.even? ------- #{t.even?}"
      if t.even?
        m = Match.create!(match_number: t/2, name: name, time: DateTime.new(2016,2,20,6,0,0))
        self.matches << m

        dp1 = DrawPosition.create!(draw_positions_number: m.match_number * 2)
        m.draw_positions << dp1
        self.draw_positions << dp1

        dp2 = DrawPosition.create!(draw_positions_number: m.match_number * 2 + 1)
        m.draw_positions << dp2
        self.draw_positions << dp2
      else
        next
      end
    end
  end

  def create_champion_position
    dp = DrawPosition.create!(draw_positions_number: 1)
    self.draw_positions << dp
  end
end
