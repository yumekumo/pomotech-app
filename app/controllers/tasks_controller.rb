class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy, :timer]
  
  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.is_finished = false
    @task.user_id = current_user.id
    if @task.save
      redirect_to task_path(@task), notice: "You have created task successfully."
    else
      @tasks = current_user.tasks
      render 'index'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(edit_task_params)
      redirect_to task_path(@task), notice: "You have updated task successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def timer
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
  
  def edit_task_params
    params.require(:task).permit(:title, :body, :is_finished)
  end
  
  def ensure_correct_user
    @task = Task.find(params[:id])
    unless @task.user_id == current_user.id
      redirect_to tasks_path
    end
  end
end
