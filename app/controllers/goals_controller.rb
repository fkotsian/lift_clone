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
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
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
