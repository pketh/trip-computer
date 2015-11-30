initialStarCount = 20
starCount = 1
maxStars = 100
width = $(document).width()
console.log width
height = $(document).height()
console.log height

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

drawStar() for [1..initialStarCount]

timedStars = ->
  if starCount < maxStars
    drawStar()
    starCount++

setInterval(timedStars, 500)
console.log starCount


# add satelite / j-fog
