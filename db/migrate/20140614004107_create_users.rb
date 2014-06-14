class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :user_friendship, index: true
      t.references :piece, index: true

      t.timestamps
    end
  end
end
