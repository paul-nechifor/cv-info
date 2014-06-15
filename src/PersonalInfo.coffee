marked = require 'marked'

class module.exports
  constructor: (@info, @data) ->
    @pers = @data.personal
    @descShort = marked @pers.descShort if @pers.descShort
    @descLong = marked @pers.descLong if @pers.descLong
    @interestsDesc = marked @pers.interestsDesc

  name: -> "#{@pers.name.first} #{@pers.name.last}"

  titles: -> @pers.titles
