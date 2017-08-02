class AnswersController < ApplicationController
  def create
    @answer = Answer.create(answer_params)
    @answer.user = current_user
    @answer.question = Question.find(params[:id])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      redirect_to questions_path
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.user == current_user
      if @answer.update(answer_params)
        redirect_to question_path(@answer.question)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
