{CompositeDisposable} = require 'atom'

module.exports = Camelify =
  subscriptions: null

  activate: ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'camelify:convert': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    console.log 'Camelify was toggled!'
