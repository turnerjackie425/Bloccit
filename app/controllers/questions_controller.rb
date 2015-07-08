class QuestionController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = question.new(params.require(:post).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end
end
