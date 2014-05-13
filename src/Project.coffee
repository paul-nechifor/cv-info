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

    # GitHub project name. If equal to 'Yes' or projectSettings.githubDefaultOn
    # is true then it will be set to @code.
    @github =
      if @data.github is 'Yes' or @projects.data.projectSettings.githubDefaultOn
        @code
      else
        @data.github
