class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User' # This line tells Rails that the friend column in the friendships table is a foreign key that points to the users table. The class_name: 'User' option tells Rails to use the User model to find the associated record.
end
