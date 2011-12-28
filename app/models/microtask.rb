class Microtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :worker
  
  before_save :default_values
  
  def default_values
    self.status = "pending" unless self.status
  end
  
end
