window.Link = Backbone.Model.extend
  initialize: (attributes) ->
    title = attributes.title
    if title.length > 60
      attributes.title = title.slice(0,57) + '...'
    this.set(attributes)
  url: ->
