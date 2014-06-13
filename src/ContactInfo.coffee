class module.exports
  constructor: (@info, @data) ->
    @map = {}
    @list = []

    for contactElem in @data.contact
      for Type in CONTACT_LIST
        key = Type.name
        if contactElem[key]?
          type = new Type this, contactElem[key]
          @map[key] = type
          @list.push type
          break

class Generic
  constructor: (@contact, @data) ->

  url: -> throw 'Not implemented.'
  description: -> ''
  type: -> return @constructor.name

class homepage extends Generic
  constructor: ->
    super
    @domain = @data.domain

  url: -> @data.url
  description: -> 'homepage'

class email extends Generic
  constructor: ->
    super
    @address = @data

  url: -> 'mailto:' + @address
  description: -> 'email address'

class github extends Generic
  ROOT = 'https://github.com'

  constructor: ->
    super
    @account = @data

  url: -> "#{ROOT}/#{@account}"
  description: -> 'GitHub account'

  # Get URL of the specified GitHub project.
  project: (name) ->
    "#{@url()}/#{name}"

  # Return local project if not a complete URL.
  transformUrl: (url) ->
    if url.indexOf('http://') is 0 or url.indexOf('https://') is 0
      url
    else
      @project url

class linkedin extends Generic
  constructor: ->
    super
    @linkPart = @data

  url: -> 'http://www.linkedin.com/pub/' + @linkPart
  description: -> 'LinkedIn profile'

class facebook extends Generic
  constructor: ->
    super
    @account = @data

  url: -> 'http://facebook.com/' + @account
  description: -> 'Facebook account'

class skype extends Generic
  constructor: ->
    super
    @account = @data

  url: -> 'skype:' + @account + '?call'
  description: -> 'Skype account'

class instagram extends Generic
  constructor: ->
    super
    @account = @data

  url: -> 'http://instagram.com/' + @account
  description: -> 'Instagram gallery'

class youtube extends Generic
  constructor: ->
    super
    @account = @data

  url: -> 'https://www.youtube.com/user/' + @account
  description: -> 'YouTube channel'

class twitter extends Generic
  constructor: ->
    super
    @account = @data

  url: -> 'https://twitter.com/' + @account
  description: -> 'Twitter account'

class blog extends Generic
  constructor: ->
    super
    @urlData = @data

  url: -> @urlData
  description: -> 'blog'

class stackoverflow extends Generic
  constructor: ->
    super
    @name = @data.name
    @number = @data.number

  url: -> "http://stackoverflow.com/users/#{@number}/#{@name}"
  description: -> 'Stack Overflow account'

CONTACT_LIST = [homepage, email, github, linkedin, facebook, skype, instagram,
    youtube, twitter, blog, stackoverflow]
