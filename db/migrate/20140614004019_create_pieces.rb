class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.references :user, index: true
      t.references :version, index: true
      t.boolean :public
      t.boolean :share_with_all_friends
      t.string :share_with_select_friends, array: true, default: [ ]

      t.timestamps
    end
  end
end
