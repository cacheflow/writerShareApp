class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :piece, index: true

      t.timestamps
    end
  end
end
