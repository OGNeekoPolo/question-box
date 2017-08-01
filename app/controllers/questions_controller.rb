class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all.page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)

    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(:question_id => @question.id)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(questions_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def questions_params
      params.require(:question).permit(:title, :body)
    end
end
