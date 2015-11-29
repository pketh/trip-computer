express = require 'express'
router = express.Router()
kaomoji = require 'kaomoji'

# GET home page.
router.get '/', (req, res, next) ->
  res.render 'index',
    title: 'Trip Computer'
    kaomoji: kaomoji.sad()

module.exports = router
