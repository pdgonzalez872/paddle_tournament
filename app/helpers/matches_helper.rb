module MatchesHelper
end

# <!-- iterate through both dps for match -->
#
# <% match.draw_positions.each do |dp| %>
#
# <!-- if has player, show player -->
#   <% if dp.players.any? %>
#   <!-- render player -->
#     <%= render partial: "draw_positions/show_player", locals: {dp: dp} %>
#     <!-- <%= dp.players.first.name %> -->
#
#   <% else %>
#     <!-- <%= render partial: "draw_positions/show_nothing" %> -->
#
#   <% end %>
#
# <!-- if has sibling, let add -->
#   <!-- add winner -->
# <!-- nothing, show nothing -->
#   <!-- <%= render partial: "draw_positions/show_nothing" %> -->
#
# <% end %>



# <% if match.players.count == 2 %>
#   <%= render partial: "draw_positions/show_both_players", locals: { match: match }%>
#
# <% elsif match.players.count == 1 %>
#   <%= render partial: "draw_positions/show_player" %>
# <% elsif Draw.match_has_adjacent_players?(match.draw_positions.first) || Draw.match_has_adjacent_players?(match.draw_positions.last) %>
#   <%= render partial: "draw_positions/add_winner", locals: { match: match } %>
#
# <% else %>
#   <%= render partial: "draw_positions/show_nothing" %>
# <% end %>
