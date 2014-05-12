class Generic
  constructor: (@contact, @data) ->

class GitHub extends Generic
  ROOT = 'https://github.com'

  constructor: ->
    super
    @account = @data.github

  home: ->
    "#{ROOT}/#{@account}"

  project: (name) ->
    "#{@home()}/#{name}"

exports.types =
  github: GitHub
