class UsersController < ApplicationController
  before_filter :current_user
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(params[:sort] + " " + params[:direction])
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
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "username"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username, :password_confirmation)
  end
end
