width = $(document).width()
height = $(document).height()

stars = 1
additionalStars = Math.round (width * height) / 3500
initialStars = Math.round (width * height) / 25000
console.log "#{initialStars} initial stars"
console.log "#{additionalStars} additional stars"

canvas = $('#stars')
context = canvas[0].getContext "2d"

context.canvas.width = width
context.canvas.height = height

drawStar = (color) ->
  context.fillStyle = color
  x = _.random 15, width
  y = _.random 15, height
  context.fillRect(x, y, 2, 2)

drawStar('yellow') for [1..initialStars]

timedStars = ->
  if stars < additionalStars
    drawStar('yellow')
    stars++

setInterval(timedStars, 250)

cat = $('.draggable .cat')
cat.css
  'left': _.random 30, width
  'top': _.random 30, height

cat.draggabilly()
