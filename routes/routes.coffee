express = require 'express'
router = express.Router()
kaomoji = require 'kaomoji'

shortSadKaomoji = ->
  km = kaomoji.sad()
  while km.length > 10
    km = kaomoji.sad()
  km

router.get '/', (req, res, next) ->
  res.render 'index',
    title: 'Trip Computer'
    kaomoji: shortSadKaomoji()
    numberOfRecords: 3
    recordScript: "/scripts/index.js"

router.get '/lucidity', (req, res, next) ->
  res.render 'lucidity',
    title: 'Lucidity'
    recordStyles: "/stylesheets/lucidity.css"

module.exports = router
