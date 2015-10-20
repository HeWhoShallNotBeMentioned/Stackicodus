class UsersController < ApplicationController
  before_filter :current_user
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + ' ' + sort_direction)
    @question = Question.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @question = Question.new
    @questions = @user.questions
  end

  def update
    @user = User.find(params[:id])
    if params[:admin]
      if @user.update(admin: true)
        redirect_to @user
      else
        flash[:alert] = "There was a problem making this user an admin."
        redirect_to @user
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @questions = @user.questions
    @questions.each do |question|
      question.destroy
    end
    @user.destroy
    flash[:alert] = "The user account has been deleted."
    redirect_to  users_path
  end


  private
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "username"
  end

  def user_params
    params.require(:user).permit(:email, :password, :username, :password_confirmation, :admin)
  end
end
