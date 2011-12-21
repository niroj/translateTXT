class AddCreditsAndUsernameToRequesters < ActiveRecord::Migration
  def change
    add_column :requesters, :credits, :integer
    add_column :requesters, :username, :string
  end
end
