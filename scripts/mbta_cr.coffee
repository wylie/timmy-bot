# Description:
#   Scheduled comments from Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Wylie

module.exports = (robot) ->

  # days of the week
  # setInterval (->
  robot.hear /\bmbta\s(.*)\b/i, (res) ->
    stop = res.match[1].trim().toLowerCase() # get the stop
    res.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        # robot.send room: "testing", "#{json.Messages[1].Stop}"
        while i < json.Messages.length.toLowerCase() # loop through each channel
          jsonStop = json.Messages[i].Stop
          if jsonStop == stop # if the channel matches grab the channel ID so we can make a link
            robot.send "> The Stop is #{json.Messages[i].Stop} and it's scheduled for #{json.Messages[i].Scheduled}"
          i++
  #   return
  # ), 6000