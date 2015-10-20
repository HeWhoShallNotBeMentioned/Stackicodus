class QuestionsController < ApplicationController
  before_filter :current_user

  def index
    @questions = Question.all
    @question = Question.new
    @answers = Answer.all
  end

  def create
    @question = @current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = 'Your question has been saved.'
      redirect_to '/'
    else
      flash[:alert] = 'There was a problem saving your question.'
      redirect_to '/'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers= @question.answers
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit(:title, :text)
  end
end
