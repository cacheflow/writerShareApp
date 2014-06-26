class AddHiddenToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :hidden, :text
  end
end
