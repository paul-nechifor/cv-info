Project = require './Project'

module.exports = class ProjectsInfo
  constructor: (@info, @data) ->
    @list = (new Project this, x for x in @data.projects)

  secondaryLoad: ->
    for project in @list
      project.secondaryLoad()
    return

  tagFilter: (tag) ->
    @list.filter (p) -> p.tags.set[tag]

  tagOrder: (tag) ->
    @tagFilter(tag).sort (a, b) ->
      if a.tags.priorities[tag] > b.tags.priorities[tag]
        1
      else if a.tags.priorities[tag] < b.tags.priorities[tag]
        -1
      else 0
