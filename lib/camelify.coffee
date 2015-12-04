CamelifyView = require './camelify-view'
{CompositeDisposable} = require 'atom'

module.exports = Camelify =
  camelifyView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @camelifyView = new CamelifyView(state.camelifyViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @camelifyView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'camelify:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @camelifyView.destroy()

  serialize: ->
    camelifyViewState: @camelifyView.serialize()

  toggle: ->
    console.log 'Camelify was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
