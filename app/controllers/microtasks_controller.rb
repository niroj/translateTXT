class MicrotasksController < ApplicationController



  def hit
    @microtask = Microtask.find(params[:id])
    @microtask.hit = false
    @microtask.save
  end 


  def update
    @microtask =  Microtask.find(params[:id])
    @microtask.worker = current_worker
    current_worker.submitted += 1
    current_worker.save
    respond_to do |format|
      if  @microtask.update_attributes(params[:microtask])
        format.html { redirect_to worker_root_path }
        format.js
      end
    end
  end



end

