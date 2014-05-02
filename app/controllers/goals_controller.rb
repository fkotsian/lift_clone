class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def create
    @user = current_user
    @goal = Goal.new(goal_params)
    @goal.user_id = @user.id

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def update
  end

  def edit
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :public, :completed)
  end
end
