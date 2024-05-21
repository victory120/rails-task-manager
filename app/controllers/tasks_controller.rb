class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  class TasksController < ApplicationController
    def show
      @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path, alert: "Task not found."
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
