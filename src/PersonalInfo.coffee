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
    loc = @data.location or {}
    @normal = loc.normal

class Description
  constructor: (@data) ->
    desc = @data.description or {}
    @short = if desc.short then marked desc.short else ''
    @long = if desc.long then marked desc.long else ''

class InterestSet
  constructor: (@data) ->
    @list = @data.interests or []
    @shortList = @list.map (i) -> i.name
