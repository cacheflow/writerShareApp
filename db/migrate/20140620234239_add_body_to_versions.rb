class AddBodyToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :body, :text
  end
end
