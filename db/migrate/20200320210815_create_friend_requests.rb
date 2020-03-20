class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.integer :creator
      t.integer :friend
      t.integer :status
      t.users :references

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :creator
    add_foreign_key :friend_requests, :users, column: :friend
  end
end
