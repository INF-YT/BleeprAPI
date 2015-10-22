#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require cable
#= require_tree .

@App = {}
App.cable = Cable.createConsumer "ws://localhost:28080"
App.messages = App.cable.subscriptions.create 'CustomersChannel',
  received: (data) ->
    console.log data

  renderMessage: (data) ->
    console.log data
