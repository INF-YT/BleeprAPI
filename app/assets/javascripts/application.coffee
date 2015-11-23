#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require cable
#= require_tree .

@App = {}
App.cable = Cable.createConsumer 'ws://' + window.location.host + '/websocket/'
App.messages = App.cable.subscriptions.create 'RelayChannel',
  received: (data) ->
    $("#button").text(data.button)

  renderMessage: (data) ->
    console.log data
