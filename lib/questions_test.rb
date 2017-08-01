class QuestionsTest

  def create
    @question = Question.new(question_params)

    if @question.save
      true
    else
      false
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
