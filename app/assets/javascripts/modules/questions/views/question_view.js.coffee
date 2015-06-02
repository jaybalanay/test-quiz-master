App.module "Questions", (Questions) ->

  class Questions.QuestionView extends Marionette.ItemView
    template: 'questions/templates/question'

    ui:
      alert: '.alert'
      answer: 'input[name=answer]'

    events:
      'submit form': 'submit'

    submit: (e) ->
      e.preventDefault()
      answer = @ui.answer.val()
      if @correctAnswer(answer)
        @ui.alert.text("Correct!")
        @ui.alert.removeClass('hide')
      else
        @ui.alert.text("Sorry. That is incorrect.")
        @ui.alert.removeClass('hide')

    correctAnswer: (submission) ->
      correct_answer = @model.acceptableFormat(@model.attributes.answer)
      new_answer = @model.acceptableFormat(submission)
      correct_answer == new_answer
