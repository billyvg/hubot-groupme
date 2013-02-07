# hubot dependencies
Robot   = require('hubot').Robot
Adapter = require('hubot').Adapter
TextMessage = require('hubot').TextMessage
WebSocketClient = require('websocket').client

class GroupMeBot extends Adapter
  send: (envelope, message) ->

    # as of hubot 2.4.2, the first param to send() is an object with 'user'
    # and 'room' data inside. detect the old style here.
    if envelope.reply_to
      user = envelope
    else
      # expand envelope
      user = envelope.user
      room = envelope.room

  reply: (envelope, strings...) ->
    ''

  topic: (envelope, strings...) ->
    ''

  run: ->
    self = @
    @options =
      accessToken: process.env.HUBOT_GROUPME_TOKEN
      userId: process.env.HUBOT_GROUPME_USERID
      botName: process.env.HUBOT_GROUPME_BOTNAME
      botId: process.env.HUBOT_GROUPME_BOTID
      groups: process.env.HUBOT_GROUPME_GROUPS
      debug: process.env.HUBOT_GROUPME_DEBUG or false
      
    console.log "GroupMe adapter loaded"

    bot = new groupmebot.Bot @options
    
    bot.on 'connect', (connection) ->
      



  close: ->
    ''


exports.use = (robot) ->
  new GroupMeBot robot
