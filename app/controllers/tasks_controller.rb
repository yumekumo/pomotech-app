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
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(edit_task_params)
      redirect_to task_path(@task), notice: "You have updated task successfully."
    else
      render 'edit'
    end
  end

  def delete
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

end
