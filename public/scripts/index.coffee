stars = 15
maxStars = 100
width = $(window).width()
height = $(window).height()

canvas = $('#stars')
context = canvas[0].getContext "2d"

context.canvas.width = width
context.canvas.height = height

context.fillStyle = "yellow"

x = _.random(10, width)
y = _.random(10, height)
context.fillRect(x, y, 2, 2)

while stars < maxStars
  stars++
  
  console.log stars