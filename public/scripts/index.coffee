width = $(document).width()
height = $(document).height()

stars = 1
additionalStars = Math.round (width * height) / 6000
initialStars = Math.round (width * height) / 25000
console.log "#{initialStars} initial stars"
console.log "#{additionalStars} additional stars"

canvas = $('#stars')
context = canvas[0].getContext "2d"

context.canvas.width = width
context.canvas.height = height

context.fillStyle = "yellow"

# twinkling:
# make an array of stars
# then 80% chance of adding the next star in the array and adding it to drawnStars []
# else remove a star from drawnStars []

drawStar = ->
  x = _.random(15, width)
  y = _.random(15, height)
  context.fillRect(x, y, 2, 2)

drawStar() for [1..initialStars]

timedStars = ->
  if stars < additionalStars
    drawStar()
    stars++

setInterval(timedStars, 500)


# add satelite / j-fog
