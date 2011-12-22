class WorkerController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @microtasks = Microtask.order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  private
  def sort_column
    Microtask.column_names.include?(params[:sort]) ? params[:sort] : "price"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
 

end

