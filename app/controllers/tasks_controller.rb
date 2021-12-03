class TasksController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    # @tasks = Task.all
    @tasks = Task.order("#{sort_column} #{sort_direction}")
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : 'importance'
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  def search
    @tasks = Task.search(params[:keyword])
    @tasks = @tasks.all
    @keyword = params[:keyword]
    render "index"
  end

  private
    def task_params
      params.require(:task).permit(:title, :body, :importance)
    end
end
