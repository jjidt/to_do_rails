class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:id)
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.new(name: params[:name],
                     due: params[:due])
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params[:task])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(task[:id])
    @task.destroy
    render ('tasks/destroy.html.erb')
  end

  def done
    @task = Task.find(task[:id])
    @task.update(params[:done])
    render('tasks/index.html.erb')
  end
end
