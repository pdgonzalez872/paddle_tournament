t = Tournament.create!(name: "Weekend Women's Tournament")

d = Draw.create!(name: "Main", size: 32)

t.draws << d

position_range = 32..63

player_array = [ 'Laird/Watkins',
                 'Gartzke/Schacherer',
                 'Harris/Mallahan',
                 'Brace/Slepian',
                 'Chiang/Weinstein',
                 'Bolling/Rizzolo',
                 'Tarpo/Moriarty',
                 'Chircop/Milling',
                 'Feldman/Turban',
                 'Borchew/Samson',
                 'Daly/Redman',
                 'Hughes/Wenzel',
                 'Hall/Young',
                 'Goodrich/Whipple',
                 'Peterson/Polayes',
                 'Anderson/Deloach',
                 'Lurie/Perkins',
                 'Davis/Williams',
                 'Foley/Laing',
                 'Montgomery/Wheeler',
                 'Crane/Weitzman',
                 'Cridland/Joyce',
                 'Fyk/Huggins',
                 'Bahr/Karaba',
                 'Beall/Korniczky',
                 'Keenan/Kenny',
                 'Ash/Robinson',
                 'Moore/Parsons',
                 'Faurot/Seaman',
                 'McCallum/Wascher',
                 'Chandler/Klaeser',
                 'Padgitt/Sciortino' ]

player_hash = Hash[player_array.zip position_range]

# populates
player_hash.each do |k, v|
  d = DrawPosition.find_by(draw_positions_number: v)
  player = Player.create!(name: k)
  d.players << player
end

w = Draw.create!(name: "Consolation", size: 16)
t.draws << w

w = Draw.create!(name: "Last Chance", size: 8)
t.draws << w

w = Draw.create!(name: "Quarter Reprieve", size: 4)
t.draws << w

w = Draw.create!(name: "Reprieve", size: 8)
t.draws << w

# Add locations
wn = Location.create!(name:           'Winnetka',
                      address:        '1395 Oak St., Winnetka, IL  60093',
                      short_letters:  'WN')

ssr = Location.create!(name:          'Sunset Ridge Country Club',
                       address:       '2100 Sunset Ridge Road, Northfield, IL 60093',
                       short_letters: 'SSR')

gvc = Location.create!(name:          'Glen View Club',
                      address:        '100 Golf Road, Golf, IL 60025',
                      short_letters:  'GVC')

sk = Location.create!(name:           'Skokie Country Club',
                      address:        '701 Prairie Road, Glencoe IL',
                      short_letters:  'SK')

ga = Location.create!(name:           'Green Acres Country Club',
                      address:        '916 Dundee Road, Northbrook, IL',
                      short_letters:  'GA')

# Allocation draw 1:
draw = Draw.find(1)

[16, 17].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  gvc.matches << match
end

[18, 19].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  wn.matches << match
end

[20, 21].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  gvc.matches << match
end

[22, 23].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  ssr.matches << match
end

[24, 25].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  sk.matches << match
end

[26, 27].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  ga.matches << match
end

(28..31).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  wn.matches << match
end

[8].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  gvc.matches << match
end

[9].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wn.matches << match
end

[10].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  gvc.matches << match
end

[11].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ssr.matches << match
end

[12].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  sk.matches << match
end

[13].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ga.matches << match
end

[14, 15].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wn.matches << match
end

(4..7).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  wn.matches << match
end

(2..3).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  wn.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end

# Allocation draw 2:
draw = Draw.find(2)

[8].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  gvc.matches << match
end

[9].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wn.matches << match
end

[10].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  gvc.matches << match
end

[11].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ssr.matches << match
end

[12].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  sk.matches << match
end

[13].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ga.matches << match
end

[14, 15].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wn.matches << match
end

[4].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  gvc.matches << match
end

[5].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  gvc.matches << match
end

[6].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  sk.matches << match
end

[7].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  sk.matches << match
end

[2].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  gvc.matches << match
end

[3].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  sk.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end

# Allocation draw 3:
draw = Draw.find(3)

[4].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  gvc.matches << match
end

[5].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  gvc.matches << match
end

[6].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  ssr.matches << match
end

[7].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  ssr.matches << match
end

[2].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  wn.matches << match
end

[3].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  ssr.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end

# Allocation draw 4:
draw = Draw.find(4)

[2, 3].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  wn.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end

# Allocation draw 5:
draw = Draw.find(5)

[4, 5].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  wn.matches << match
end

[6, 7].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  ga.matches << match
end

[2].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  wn.matches << match
end

[3].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  ga.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end
