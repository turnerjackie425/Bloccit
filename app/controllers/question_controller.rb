class QuestionController < ApplicationController
  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
  end

  def show
    @question = Question..find(params[:id])
  end

  def edit
  end
end
