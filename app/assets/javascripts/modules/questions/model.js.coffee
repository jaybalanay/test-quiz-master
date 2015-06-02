App.module "Questions", (Questions) ->

  class Questions.Model extends Backbone.Model
    urlRoot: "/api/questions"
    defaults:
      question: ''
      answer: ''
    acceptableFormat: (str)->
      formatted_string = str.replace(/\s+|\s+$/g,'').toLowerCase()
      return formatted_string

  class Questions.Collection extends Backbone.Collection
    model: Questions.Model
    url: "/api/questions"
