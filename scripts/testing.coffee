# Description:
#   Testing stuff
#
# Commands:
#   hubot test - Run a test!

module.exports = (robot) ->

  robot.respond /test/i, (msg) ->
    setTimeout () ->
      msg.send "huzzah!"
    , Math.random() * 1000