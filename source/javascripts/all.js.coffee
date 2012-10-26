#= require hamlcoffee
#= require_tree ./templates/
#= require ./lib/jquery-1.8.2
#= require ./lib/underscore
#= require ./lib/backbone
#
#= require_self
#= require ./models/application
#= require_tree ./models/
#= require_tree ./plugins/
#= require_tree ./initializers/

window.Branding =
  Plugins: {}
  Models: {}
  Views: {}
  Collections: {}

$ ->
  Branding.app.initialize()
