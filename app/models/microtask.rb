class Microtask < ActiveRecord::Base
  belongs_to :task
  has_many :solutions
end
