class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy, :timer]

  def index
    @tasks = current_user.tasks
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)
    @new_task.is_finished = false
    @new_task.user_id = current_user.id
    if @new_task.save
      redirect_to task_path(@new_task), notice: "You have created task successfully."
    else
      @tasks = current_user.tasks
      render 'index'
    end
  end

  def show
    @new_task = Task.new
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
