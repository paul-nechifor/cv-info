marked = require 'marked'

class module.exports
  constructor: (@info, @data) ->
    @pers = @data.personal
    @descShort = @pers.descShort
    @descLong = @pers.descLong
    @interestsDesc = marked @pers.interestsDesc

  name: -> "#{@pers.name.first} #{@pers.name.last}"

  titles: -> @pers.titles
