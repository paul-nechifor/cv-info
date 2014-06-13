class module.exports
  constructor: (@info, @data) ->
    @pers = @data.personal
    @descShort = @pers.descShort
    @descLong = @pers.descLong

  name: -> "#{@pers.name.first} #{@pers.name.last}"

  titles: -> @pers.titles
