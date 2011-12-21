class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :requester
      t.text :content
      t.string :lang_from
      t.string :lang_to
      t.integer :budget
      t.integer :rating
      t.integer :status

      t.timestamps
    end
    add_index :tasks, :requester_id
  end
end
