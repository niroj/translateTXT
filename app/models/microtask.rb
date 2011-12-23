class Microtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :worker
end
