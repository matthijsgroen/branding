class Branding.Application

  constructor: ->
    @initialized = no

  initialize: ->
    return if @initialized
    world = {}
    @trigger 'application:setup', world
    @trigger 'application:initialize', world
    @intialized = yes

_.extend Branding.Application.prototype, Backbone.Events

Branding.app = new Branding.Application
