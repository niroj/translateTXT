class TasksController < ApplicationController
  
  before_filter :authenticate_requester!
  before_filter :find_requester

  def index
    @tasks = @requester.tasks
  end
  
  
  
  def show
      @task = Task.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.js
      end
    end
  
  
  def create
    @task = @requester.tasks.new(params[:task])
    @task.save
    respond_to do |format|
          format.html { redirect_to @requester, notice: 'task was successfully created.' }
          format.js         
      end
  end

  # def destroy
  #   
  #   @task = Task.find(params[:id])
  #   if @requester.user == current_user 
  #     
  #      @task.destroy
  #     respond_to do |format|
  #       format.html { redirect_to @requester }
  #       format.json { head :ok }
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { redirect_to @requester, notice: 'you are not authorized to delete' }
  #       format.json { head :ok }
  #     end
  #   end
  # end




	private

	def find_requester
		@requester = Requester.where(:id => current_requester.id).first
	end


end