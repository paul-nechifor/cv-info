class module.exports
  constructor: (@projects, @data) ->
    # The display name of the project.
    @name = @data.name

    # Short description of the project (one-two lines).
    @desc = @data.desc

    # URL for the report of the project.
    @report = @data.report

    # General purpose codename for the project (usually derived from the name).
    @code = @data.code

    # GitHub project name, or 'Yes' to be equal to @code.
    @github =
      if @data.github is 'Yes'
        @code
      else
        @data.github
