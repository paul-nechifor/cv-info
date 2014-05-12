contact = require './contact'

class module.exports
  constructor: (@info, @data) ->
    @contact = {}

    for key, Type of contact.types
      type = new Type this, @data.contact
      @contact[key] = type
