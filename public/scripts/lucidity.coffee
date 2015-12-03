# $('.kai').css('background-color': randomColor({'luminosity': 'light'}))
# $('.thomas').css('background-color': randomColor({'luminosity': 'light'}))

# TODO optionize functs

circlePoints = []

width = $(document).width()
height = $(document).height()
console.log "width ", width
console.log 'height', height

# create points

jitter = (value, jitterMultiplier) ->
  deviation = Math.random() * jitterMultiplier
  value + deviation

createCirclePoints = (points, radius, center, jitterMultiplier) ->
  slice = 2 * Math.PI / points
  for i in [0...points]
    angle = slice * i
    x = center.x + radius * Math.cos(angle)
    y = center.y + radius * Math.sin(angle)
    point =
      x: jitter x, jitterMultiplier
      y: jitter y, jitterMultiplier
    circlePoints.push point
  drawCircle circlePoints

drawCircle = (circlePoints) ->
  for point in circlePoints
    # if randomColors
    # context.fillStyle = randomColor()
    # else
    context.fillStyle = 'white'
    # context.globalAlpha = _.random 0.8, 1
    # fill opacity = _.random 0.5, 1
    context.fillRect(point.x, point.y, 2, 2)

canvas = $('#outer-ring')
context = canvas[0].getContext "2d"
context.canvas.width = width * 2
context.canvas.height = height * 2

points = height * 1.5
radius = width / 2
center =
  x: width
  y: height
jitterAmount = 15
createCirclePoints points, radius, center, jitterAmount

canvas = $('#inner-ring')
context = canvas[0].getContext "2d"
context.canvas.width = width * 2
context.canvas.height = height * 2

circlePoints = []
points = height
radius = width / 3
center =
  x: width
  y: height
jitterAmount = 15
createCirclePoints points, radius, center, jitterAmount

canvas = $('#center')
context = canvas[0].getContext "2d"
context.canvas.width = width * 2
context.canvas.height = height * 2

circlePoints = []
points = height / 2
radius = width / 8
center =
  x: width
  y: height
jitterAmount = 25
createCirclePoints points, radius, center, jitterAmount
