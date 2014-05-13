yaml = require 'js-yaml'
fs = require 'fs'
ProjectsInfo = require './ProjectsInfo'
ContactInfo = require './ContactInfo'

class module.exports
  constructor: ->
    @json = null

  loadFromFile: (path, cb) ->
    fs.readFile path, 'utf8', (err, yamlData) =>
      return cb err if err
      try
        @loadWithYaml yamlData
      catch err
        return cb err
      cb()

  loadWithYaml: (yamlData) ->
    @json = yaml.safeLoad yamlData
    @constructInfos()

  loadWithJson: (json) ->
    @json = json
    @constructInfos()

  constructInfos: ->
    @projects = new ProjectsInfo this, @json
    @contact = new ContactInfo this, @json
