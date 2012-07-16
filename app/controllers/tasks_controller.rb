class TasksController < ApplicationController
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  def create
    @task = Task.new(params[:list])
    respond_to do |format|
      if @list.save
        format.html { redirect_to action: :index, notice: 'New task has been created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


end
