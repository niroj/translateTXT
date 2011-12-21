class CreateMicrotasks < ActiveRecord::Migration
  def change
    create_table :microtasks do |t|
      t.text :original
      t.text :translate
      t.integer :price
      t.boolean :hit
      t.references :task

      t.timestamps
    end
    add_index :microtasks, :task_id
  end
end
