circlePoints = []

drawCirclePoints = (circlePoints) ->
  console.log circlePoints
  # create a canvas and put some points on it

jitter = (value) ->
  deviation = Math.random()
  value + deviation

createCirclePoints = (points, radius, center) ->
  slice = 2 * Math.PI / points
  for i in [0...points]
    angle = slice * i
    x = center.x + radius * Math.cos(angle)
    y = center.y + radius * Math.sin(angle)
    point =
      x: jitter(x)
      y: jitter(y)
    circlePoints.push point
  drawCirclePoints circlePoints

points = 8
radius = 10
center =
  x: 0
  y: 0
createCirclePoints points, radius, center



