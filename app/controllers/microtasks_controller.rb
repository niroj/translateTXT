class MicrotasksController < ApplicationController

  def hit
    @microtask = Microtask.find(params[:id])
    @microtask.hit = false
    @microtask.status = "review pending"
    @microtask.save
  end 
  def approve
    @microtask = Microtask.find(params[:id])
    @microtask.status = "completed"
    @m_worker = Worker.where(:id => @microtask.worker_id).first
    @m_worker.earning += @microtask.price
    @m_worker.accepted += 1   
    @microtask.save
    @m_worker.save
  end
  def reject
    @microtask = Microtask.find(params[:id])
    @microtask.status = "pending"
    @microtask.hit = true
    @microtask.translate = nil
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

