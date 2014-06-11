class Generic
  constructor: (@contact, @data) ->

class GitHub extends Generic
  ROOT = 'https://github.com'

  constructor: ->
    super
    @account = @data.github

  # Get URL of GitHub account.
  home: ->
    "#{ROOT}/#{@account}"

  # Get URL of the specified GitHub project.
  project: (name) ->
    "#{@home()}/#{name}"


  transformUrl: (url) ->
    if url.indexOf('http://') is 0 or url.indexOf('https://') is 0
      url
    else
      @project url

exports.types =
  github: GitHub
