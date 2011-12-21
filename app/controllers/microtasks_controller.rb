class MicrotasksController < ApplicationController
  
def show
  binding.pry
  @microtasks = @task.microtasks
  
end
  
  
  private

	def find_task
		@task = Task.find(params[:task_id])
	end
end

