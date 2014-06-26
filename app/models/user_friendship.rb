class UserFriendship < ActiveRecord::Base

    # This is the join table that is referenced by both the friend_id and the user_id for the list of user_friendships. It itself is also referenced with and index (user_friendships_id)
    belongs_to :user
    belongs_to :friend, :class_name => "User"
end
