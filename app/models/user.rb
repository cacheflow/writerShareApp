require 'bcrypt'

class User < ActiveRecord::Base
    belongs_to :user_friendship
    belongs_to :piece


    validates_presence_of :name, :email, :password, :password_confirmation
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_uniqueness_of :email, :name

    def password
        @password
    end

    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
    end

    def authenticate(test_password)
        if BCrypt::Password.new(self.password_digest) == test_password
            self
        else
            false
        end
    end




end
