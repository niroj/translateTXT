class TasksController < ApplicationController
  
  before_filter :authenticate_requester!
  before_filter :find_requester

  def index
    task_status_update
    @tasks = @requester.tasks
  end
  
  
  
  def show
      @task = Task.find(params[:id])
      @microtasks = @task.microtasks.paginate(:per_page => 5, :page => params[:page])
      respond_to do |format|
        format.html # show.html.erb
        format.js
      end
    end
  
  
  def create
    @task = @requester.tasks.new(params[:task])
    words_total = @task.content.split(" ")
    @no_of_words = words_total.size.to_f
    if @task.budget > @requester.credits
    else
      if (((@task.budget.to_f - @task.budget.to_f*0.2)/@no_of_words.to_f) > 0.1)
        @task.save
        respond_to do |format|
              format.html { redirect_to @requester, notice: 'task was successfully created.' }
              format.js         
        end
      else
        respond_to do |format|
              format.html { redirect_to @requester, notice: "task wasn't successfully created." }
              format.js
            end
      end
    end
  end
  
  def destroy
    @task = @requester.tasks.find(params[:id])
    if @task.requester == current_requester
      @task.microtasks.destroy_all
      @task.destroy
      @tasks = @requester.tasks
      respond_to do |format|
        format.html { redirect_to @requester, notice: 'task was successfully deleted.' }
        format.js 
      end
    else
      respond_to do |format|
        format.html { redirect_to @requester}
        format.js
      end
    end
  end

  
	private

	def find_requester
		@requester = Requester.where(:id => current_requester.id).first
	end
	
  def task_status_update
    @tasks = @requester.tasks
    @tasks.each do |t|
      t.microtasks.each do |m|
        if(m.status != "completed")
          break
        else
          t.status = "completed"
          t.save
        end
      end
    end
  end


end