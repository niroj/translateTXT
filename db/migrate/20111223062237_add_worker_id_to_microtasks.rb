class AddWorkerIdToMicrotasks < ActiveRecord::Migration
  def change
    add_column :microtasks, :worker_id, :integer
  end
end
