class UserFriendship < ActiveRecord::Base
	include PublicActivity::Common

    belongs_to :user
    belongs_to :friend, :class_name => "User"
end
