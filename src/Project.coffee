class module.exports
  constructor: (@projects, @data) ->
    # The display name of the project.
    @name = @data.name

    # General purpose codename for the project (usually derived from the name).
    @code = @data.code

    # Short description of the project (one-two lines).
    @desc = @data.desc

    @linkList = []
    @linkMap = {}
    @loadLinks @data.links if @data.links

  loadLinks: (links) ->
    for data in links
      @loadLink data
    return

  loadLink: (data) ->
    link =
      if data.blog
        type: 'blog'
        url: data.blog
      else if data.github
        type: 'github'
        url: data.github
      else if data.report
        type: 'report'
        url: data.report
      else if data.youtube
        type: 'youtube'
        url: data.youtube
    if link
      @linkList.push link
      @linkMap[link.type] = link

  secondaryLoad: ->
    if @projects.data.projectSettings.githubDefaultOn and not @data.githubOff
      @loadLink github: @code

    githubContact = @projects.info.contact.contact.github
    if githubContact and @linkMap.github
      @linkMap.github.url = githubContact.project @linkMap.github.url
