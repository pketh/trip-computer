width = $(document).width()
height = $(document).height()

stars = 1
# starCoordinates = []
additionalStars = Math.round (width * height) / 3500
# nearMaxStars = Math.round additionalStars * 0.95
initialStars = Math.round (width * height) / 25000
console.log "#{initialStars} initial stars"
console.log "#{additionalStars} additional stars"
# console.log "#{nearMaxStars} is near max stars"

canvas = $('#stars')
context = canvas[0].getContext "2d"

context.canvas.width = width
context.canvas.height = height

# twinkling: (gotta track it to kill it later)
# make an array of stars
# then 80% chance of adding the next star in the array and adding it to drawnStars []
# else remove a star from drawnStars []

# mouse shifting:
# hovering over background positions ,''

drawStar = (color) ->
  # if colors
  #   color = _.sample colors
  #   context.fillStyle = color
  # else
  context.fillStyle = color
  x = _.random 15, width
  y = _.random 15, height
  # push this to a drawn starCoordinates object array [{x:1, y:2}, {..}, {,,}]
  context.fillRect(x, y, 2, 2)

drawStar('yellow') for [1..initialStars]

# drawColoredStars = (colors) ->
#   color = _.sample colors
#   drawStar(color)

timedStars = ->
  # console.log stars
  if stars < additionalStars
    drawStar('yellow')
    stars++
  # if stars > nearMaxStars
  #   console.log 'almost at the max...'
  #   milkyway = ['purple', 'beccapurple', 'blueviolet']
  #   drawColoredStars(milkyway) for [1..10]

setInterval(timedStars, 250)

####

# random draggable eyes

# eyes = $('.draggable .eyes')
# eyes.css
#   'left': _.random 30, width
#   'top': _.random 30, height

cat = $('.draggable .cat')
cat.css
  'left': _.random 30, width
  'top': _.random 30, height

cat.draggabilly()