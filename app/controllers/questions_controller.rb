class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all.page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)
    @question.user = current_user
    respond_to do |format|
      if @question.save
        format.html {redirect_to @question, notice: "Question was successfully created."}
        format.json {render :show, status: :created, location: @question}
      else
        format.html {render :new}
        format.json {render json: @question.errors, status: :unprocessable_entity}
      end
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
    respond_to do |format|
      if @question.update(questions_params)
        format.html {redirect_to @question, notice: "Question was successfully updated."}
        format.json {render :show, status: :ok, location: @question}
      else
        format.html {render :edit}
        format.json {render json: @question.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html {redirect_to questions_path, notice: "Question was successfully deleted."}
      format.json {head :no_content}
    end
  end

  private
    def questions_params
      params.require(:question).permit(:title, :body)
    end
end
