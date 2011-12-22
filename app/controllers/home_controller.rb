class HomeController < ApplicationController
  def index
    if requester_signed_in?
      redirect_to requester_root_path
    elsif worker_signed_in?
      redirect_to worker_root_path
    end
  end
end
