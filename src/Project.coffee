class module.exports
  constructor: (@projects, @data) ->
    @name = @data.name
    @desc = @data.desc
    @report = @data.report
    @code = @data.code
    @github =
      if @data.github is 'Yes'
        @code
      else
        @data.github
