class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    binding.pry
  end
end
