class AddSubmittedAndAcceptedToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :submitted, :integer
    add_column :workers, :accepted, :integer
    remove_column :workers, :rating
  end
end
