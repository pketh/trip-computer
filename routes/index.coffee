express = require 'express'
router = express.Router()
kaomoji = require 'kaomoji'

shortKaomoji = ->
  km = kaomoji.sad()
  while km.length > 10
    console.log km.length
    km = kaomoji.sad()
  km

router.get '/', (req, res, next) ->
  res.render 'index',
    title: 'Trip Computer'
    kaomoji: shortKaomoji()
    numberOfRecords: 3

module.exports = router
