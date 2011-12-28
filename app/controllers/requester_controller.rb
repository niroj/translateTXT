class RequesterController < ApplicationController
  
  before_filter :authenticate_requester!
  respond_to :html, :json

    def show
      @requester = Requester.where(:id => current_requester.id).first
      @completed_tasks = @requester.tasks.where(:status => "completed").limit(5)
      respond_with(@requester)
    end
  
  
end
