class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :solution
      t.references :microtask
      t.references :worker

      t.timestamps
    end
    add_index :solutions, :microtask_id
    add_index :solutions, :worker_id
  end
end
