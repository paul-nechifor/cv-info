class module.exports
  constructor: (@projects, @data) ->
    # The display name of the project.
    @name = @data.name

    # General purpose codename for the project (usually derived from the name).
    @code = if @data.code then @data.code else @codifyName @data.name

    # Short description of the project (one-two lines).
    @desc = @data.desc

    @links = new LinkSet
    @links.load @data.links if @data.links

  url: ->
    @links.primaryUrl()

  secondaryLoad: ->
    if @projects.data.projectSettings.githubDefaultOn and not @data.githubOff
      @links.loadLink github: @code

    githubContact = @projects.info.contact.map.github
    if githubContact and @links.map.github
      @links.map.github.url = githubContact.project @links.map.github.url

  codifyName: (name) ->
    name.toLowerCase().replace /\s/g, '-'

class LinkSet
  TYPES =
    blog: 'blog'
    github: 'GitHub repository'
    report: 'report'
    youtube: 'YouTube video'
    project: 'project location'

  constructor: () ->
    @map = {}
    @list = []

  load: (links) ->
    for data in links
      @loadLink data
    return

  loadLink: (data) ->
    for type, desc of TYPES
      if data[type]
        link = {type: type, url: data[type], desc: desc}
        @list.push link
        @map[type] = link
        return
    return

  primaryUrl: ->
    if @map.project
      @map.project.url
    else if @map.github
      @map.github.url
    else if @list.length > 0
      @list[0].url
    else
      null
