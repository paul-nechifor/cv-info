Project = require './Project'

class module.exports
  constructor: (@info, @data) ->
    @list = (new Project this, x for x in @data.projects)
