$('.show').click ->
  $('.reveal').css('display': 'inline-block')
  $('.thalia').removeClass('show')

$('main p').not('.thalia').click ->
  console.log 'clicked'
  $('.thomas').css('background-color': randomColor({'luminosity': 'light'}))
  $('.kai').css('background-color': randomColor({'luminosity': 'light'}))


circlePoints = []
context = null

width = $(document).width()
height = $(document).height()
console.log "width ", width
console.log 'height', height

# create points

jitterPoints = (value, jitterMultiplier) ->
  deviation = Math.random() * jitterMultiplier
  value + deviation

createCirclePoints = (options) ->
  slice = 2 * Math.PI / options.points
  for i in [0...options.points]
    angle = slice * i
    x = options.center.x + options.radius * Math.cos(angle)
    y = options.center.y + options.radius * Math.sin(angle)
    point =
      x: jitterPoints x, options.jitterMultiplier
      y: jitterPoints y, options.jitterMultiplier
    circlePoints.push point
  drawCircle circlePoints

drawCircle = (circlePoints) ->
  for point in circlePoints
    context.fillStyle = 'white'
    context.fillRect(point.x, point.y, 2, 2)

setCanvasContext = (canvas) ->
  context = canvas[0].getContext "2d"
  context.canvas.width = width * 2
  context.canvas.height = height * 2
  circlePoints = []

# outer ring
canvas = $('#outer-ring')
setCanvasContext canvas
options =
  points: Math.round height * 1.5
  radius: Math.round width / 2
  center:
    x: width
    y: height
  jitterMultiplier: 15
createCirclePoints options

# middle ring
canvas = $('#middle-ring')
setCanvasContext canvas
options =
  points: Math.round height
  radius: Math.round width / 3
  center:
    x: width
    y: height
  jitterMultiplier: 15
createCirclePoints options

# inner ring
canvas = $('#inner-ring')
setCanvasContext canvas
options =
  points: Math.round height / 2
  radius: Math.round width / 8
  center:
    x: width
    y: height
  jitterMultiplier: 25
createCirclePoints options
