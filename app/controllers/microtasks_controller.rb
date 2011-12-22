class MicrotasksController < ApplicationController



  def hit
    @microtask = Microtask.find(params[:id])
    @microtask.hit = false
    @microtask.save
  end 


  def update
    @microtask =  Microtask.find(params[:id])
    
    respond_to do |format|
      if  @microtask.update_attributes(params[:microtask])
        @microtask.hit = true
        @microtask.save
        format.html { redirect_to worker_root_path }
        format.js
      end
    end
  end



end

