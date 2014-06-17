class AddIntegerToComment < ActiveRecord::Migration
  def change
    add_column :comments, :version_id, :integer
  end
end
