class AddLangFromAndLangToToMicrotasks < ActiveRecord::Migration
  def change
    add_column :microtasks, :lang_from, :string
    add_column :microtasks, :lang_to, :string
  end
end
