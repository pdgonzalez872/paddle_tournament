class Draw < ActiveRecord::Base
  # attr_accessor :default_rounds

  after_create :create_draw_structure

  has_many :matches
  has_many :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :tournament

  def self.match_has_adjacent_players?(draw_position)
    dp1 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2).players.first.nil?
    dp2 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2 + 1).players.first.nil?

    return false if dp1 && dp2
    true
  end

  def self.previous_match(draw_position:)
    draw = draw_position.draw
    match = draw.matches.find_by(match_number: draw_position.draw_positions_number)
  end

  # TODO
  def self.ongoing_matches(_draw)
    # get all the non-complete matches.
  end

  # These were private, but simplecov was red. bad simplecov.

  def draw_positions_count
    (2 * size) - 1
  end

  def create_draw_positions
    draw_positions_count.times do |_d|
      dp = DrawPosition.new
      draw_positions << dp
    end
  end

  def matches_count
    size - 1
  end

  def create_draw_structure

    rounds = Draw.default_rounds

    rounds.each do |k, v|
      if k == 'champion'
        create_champion_position
      else
        if size >= v.to_a[0]
          create_matches_and_draw_positions(rounds[k.to_s], k.to_s)
        else
          return
        end
      end
    end
  end

  def self.default_rounds
    { 'champion'   => 1,
      'final'      => (2..3),
      'semis'      => (4..7),
      'quarters'   => (8..15),
      'oitavas'    => (16..31),
      'sixty_four' => (32..63) }
  end

  def create_matches_and_draw_positions(starting_point, name)
    starting_point.each do |t|
      if t.even?
        m = Match.create!(match_number: t / 2, name: name, time: DateTime.new(2016, 2, 20, 6, 0, 0))
        matches << m

        dp1 = DrawPosition.create!(draw_positions_number: m.match_number * 2)
        m.draw_positions << dp1
        draw_positions << dp1

        dp2 = DrawPosition.create!(draw_positions_number: m.match_number * 2 + 1)
        m.draw_positions << dp2
        draw_positions << dp2
      else
        next
      end
    end
  end

  def create_champion_position
    dp = DrawPosition.create!(draw_positions_number: 1)
    draw_positions << dp
  end
end
