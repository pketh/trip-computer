express = require 'express'
path = require 'path'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
stylus = require 'stylus'
autoprefixer = require 'autoprefixer-stylus'

routes = require './routes/routes'

app = express()

# view engine setup
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded
  extended: false
app.use cookieParser()
app.use stylus.middleware
    compile: (str, path) ->
        stylus(str)
            .use autoprefixer()
    src: path.join __dirname, 'public'
app.use express.static path.join __dirname, 'public'

app.use '/', routes

# catch 404 and forward to error handler
app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

# error handlers

# development error handler
# will print stacktrace
if app.get('env') is 'development'
    app.use (err, req, res, next) ->
        res.status err.status or 500
        res.render 'error',
            message: err.message,
            error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
        message: err.message,
        error: {}

module.exports = app
