class AnswersController < ApplicationController
  before_filter :current_user
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = @current_user.id
    if @answer.save
      flash[:notice] = 'Your answer has been saved.'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Your answer has not been saved!"
      redirect_to question_path(@question)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:text)
  end
end
