class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @answers = Answer.all
    render json: @answers
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.create(answer_params)
    @answer.user = current_user
    @answer.question = Question.find(params[:id])
    respond_to do |format|
      if @answer.save
        format.html {redirect_to question_path(@answer.question), notice: "Answer successfully created."}
        format.json {render :show, status: :created, location: @answer}
      else
        format.html {redirect_to question_path(@answer.question), notice: "Answer was not able to be saved."}
        format.json {render json: @answer.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @answer = Answer.find(params[:question_id])
  end

  def update
    @answer = Answer.find(params[:question_id])
    if @answer.user_id == session[:current_user_id]
      respond_to do |format|
        if @answer.update(answer_params)
          format.html {redirect_to question_path(@answer.question), alert: "Answer has been updated"}
          format.json {render :show, status: :ok, location: @answer}
        else
          format.html {render :edit}
          format.json {render json: @answer.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:question_id])
    @question = @answer.question
    @answer.destroy
    respond_to do |format|
      format.html {redirect_to question_path(@question), notice: "Answer has been deleted"}
      format.json {head :no_content}
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
