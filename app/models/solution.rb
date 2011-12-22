class Solution < ActiveRecord::Base
  belongs_to :microtask
  belongs_to :worker
end
