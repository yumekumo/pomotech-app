class TasksController < ApplicationController
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
  end

  def delete
  end

  def timer
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end

end
