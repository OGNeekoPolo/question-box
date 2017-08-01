class AnswersController < ApplicationController
  def create
    @answer = Answer.create(answer_params)

  end

  def destroy
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
