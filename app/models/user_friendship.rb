class UserFriendship < ActiveRecord::Base
	
	include PublicActivity::Common


	has_many :users

    belongs_to :user
    belongs_to :friend, :class_name => "User"
end
