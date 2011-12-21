class RequesterController < ApplicationController
  
  before_filter :authenticate_requester!
  respond_to :html, :json

    def show
      @requester = Requester.where(:id => current_requester.id).first
      respond_with(@requester)
    end
  
  
end
