Project = require './Project'

class module.exports
  constructor: (@info, @data) ->
    @projects = (new Project this, x for x in @data.projects)
