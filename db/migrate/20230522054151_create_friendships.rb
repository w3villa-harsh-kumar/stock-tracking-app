class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, foreign_key: { to_table: :users } # This is the line that was added to the migration file to create the friendship table and the references to the users table. Here friend is the name of the column in the friendship table that will store the user_id of the friend.

      t.timestamps
    end
  end
end
