// Generated by CoffeeScript 1.9.0
(function() {
  var canvas, context, drawStar, height, initialStarCount, maxStars, starCount, timedStars, width, _i;

  initialStarCount = 20;

  starCount = 1;

  maxStars = 100;

  width = $(document).width();

  console.log(width);

  height = $(document).height();

  console.log(height);

  canvas = $('#stars');

  context = canvas[0].getContext("2d");

  context.canvas.width = width;

  context.canvas.height = height;

  context.fillStyle = "yellow";

  drawStar = function() {
    var x, y;
    x = _.random(15, width);
    y = _.random(15, height);
    return context.fillRect(x, y, 2, 2);
  };

  for (_i = 1; 1 <= initialStarCount ? _i <= initialStarCount : _i >= initialStarCount; 1 <= initialStarCount ? _i++ : _i--) {
    drawStar();
  }

  timedStars = function() {
    if (starCount < maxStars) {
      drawStar();
      return starCount++;
    }
  };

  setInterval(timedStars, 500);

  console.log(starCount);

}).call(this);
