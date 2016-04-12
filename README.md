# Intro
The idea of this project is to create a simple interface for keeping records for a paddle tournament. Here is an example of a [draw](public/buenos_aires_draw.pdf). A "draw" in tennis is considered to be the same as a "bracket" in basketball.

A paddle tournament promises to give the players the opportunity to play at least 3 matches. This is accomplished by a total of 5 draws that players cascade into based on their results. Paddle is played in a doubles format, meaning there are 2 players per team.

### The draws names are the following:

- Main
- Consolation
- Reprieve
- Quarter Reprieve
- Last Chance

### Here are the rules for draw placement:

The team will stay on the main draw until they lose. If they don't, they win the tournament. A player advances to the next round if they win the match.

If a team loses a match:

- in the first round in the Main draw, it is then placed in the Consolation draw
- in the second round in the Main draw, it is then placed in the Reprieve draw
- in the Quarter-finals in the Main draw, it is then placed in the Quarter Reprieve draw
- in the first round of the Consolation draw, it is then placed in the Last Chance draw
- in the first round of the Last Chance draw, it has already played 3 matches, therefore eliminated from the tournament

Live app is here: http://paddletournament.herokuapp.com/

# Tech
This is a Rails app with a Postgres database. There is some jQuery and JavaScript in there as well.

My good friend [Nicole Carpenter](https://github.com/NicoleCarpenter) helped me make this pretty and ready for production.

This project was modeled to handle all 5 draws in a tournament and dynamic creation of the display for the draw.

# Reflections/Takeaways
The first release (v1) was acceptable. Nicole worked her magic and made the display a lot cleaner than I had originally thought.

I was happy that the backend (data) was sound and that records were updated correctly. We achieved the basic functionality of moving a player through the draw and making it simple to do so.

Small optimizations matter. The simplest optimization that I enforced during the tournament prep meeting was to ask players to report scores via text instead of phone calls. This wasn't ever a programmatic solution, but it made life a lot easier.

It is great to have a test run and run systems in parallel.

I enjoy solving real business problems and this is a perfect example of one. Thank you Nicole for working with me!

## Things I would have liked to do if we had more time, maybe for v2:

- write more tests. this was a pain, because I had to do manual testing instead. Horrible.
- write a function that automatically places players on their subsequent draws and call the function each time until draws are all populated correctly. This was also a pain, as I had to use heroku console live to place people. Once they were on the draw, I could move them, which was fine, but placing them was annoying.
- write the draw html/css instead of using what I pieced together online. This was great to for rapid development, but yielded an annoying, inflexible interface.
- secure the app. Give basic authorization to edit the draws.
- player profile with "Next Match" feature. This is probably the most valuable feature, as it would solve most, if not all inquiries about location/time.
- upload draw with a csv feature. Instead of manually generating seed/data for each tournament
