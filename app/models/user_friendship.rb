class UserFriendship < ActiveRecord::Base
	has_many :users

	
    belongs_to :user
    belongs_to :friend, :class_name => "User"
end
