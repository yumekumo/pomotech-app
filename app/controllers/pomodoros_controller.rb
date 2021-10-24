class PomodorosController < ApplicationController
  before_action :authenticate_user!

  def create
    task = Task.find(params[:task_id])
    pomodoro = task.pomodoros.new(user_id: current_user.id)
    pomodoro.save
    if(params[:is_finished]=="true")
      task.update(is_finished: true)
      redirect_to tasks_path
    else
      redirect_to task_path(task)
    end
  end

  def destroy
  end
end
