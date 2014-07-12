marked = require 'marked'

module.exports = class PersonalInfo
  constructor: (@info, @data) ->
    pers = @data.personal
    @name = new Name pers
    @titles = new TitleSet pers
    @education = new Education pers
    @location = new Location pers
    @description = new Description pers
    @interests = new InterestSet pers

class Name
  constructor: (@data) ->
    name = @data.name
    @family = name.family
    @given = name.given
    @middle = name.middle
    @full =
      if name.full
        name.full
      else
        if @middle
          "#{@given} #{@middle} #{@family}"
        else
          "#{@given} #{@family}"
    @normal =
      if name.normal
        name.normal
      else
        "#{@given} #{@family}"

class TitleSet
  constructor: (@data) ->
    @list = @data.titles

class Education
  constructor: (@data) ->

class Location
  constructor: (@data) ->
    loc = @data.location
    @normal = loc.city.full + ', ' + loc.country.full

class Description
  constructor: (@data) ->
    @short = marked @data.description.short
    @long = marked @data.description.long

class InterestSet
  constructor: (@data) ->
    @list = @data.interests
    @shortList = @list.map (i) -> i.name
