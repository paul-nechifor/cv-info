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

exports.types =
  github: GitHub
