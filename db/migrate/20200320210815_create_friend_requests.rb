class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.references :creator, references: :users, foreign_key: { to_table: :users}
      t.references :friend, references: :users, foreign_key: { to_table: :users}
      t.integer :status

      t.timestamps
    end
  end
end
