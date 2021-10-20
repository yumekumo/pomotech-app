class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @task = Task.new
  end
  
  def create
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
  
end
