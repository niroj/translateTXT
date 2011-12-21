class AddEarningsRatingAndUsernameToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :earning, :integer
    add_column :workers, :rating, :integer
    add_column :workers, :username, :string
  end
end
