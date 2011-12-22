class MicrotasksController < ApplicationController
  
def show
  @microtasks = @task.microtasks
  
end
  
  
  private

	def find_task
		@task = Task.find(params[:task_id])
	end
	
	
  def hit
    @task = Task.find(params[:task_id])
    
  end
end

