require 'bcrypt'

class User < ActiveRecord::Base
    # the below establishes the user_friendships relationships
    has_many :user_friendships
    has_many :friends, :through => :user_friendships
    has_many :inverse_user_friendships, :class_name => "UserFriendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_user_friendships, :source => :user

    has_many :versions

    # the user must enter name, email and password
    validates_presence_of :name, :email, :password, :password_confirmation
    # the email address must have a proper format
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # the email and name of the user have to be unique
    validates_uniqueness_of :email, :name

    # this is the code for Paperclip to know that the user has attached avatar(image)
    has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "150x150#", :thumb => "45x45#" }, 
    :storage => :s3,
    #:s3_credentials => "http://localhost:3000/config/s3.yml", #  #{Rails.root}
    #:path => "/images/:id/:style.:extension",
    :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


    # the next three methods establish the user authentication

    # here we set the password to be the instance variable of @password
    def password
        @password
    end

    # this method passes the user's password to BCrypt creating the password_digest that is saved in the database
    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
    end

    # this method tests the user's password against the user's entered password to authenticate the password upon logging in
    def authenticate(test_password)
        if BCrypt::Password.new(self.password_digest) == test_password
            self
        else
            false
        end
    end

    # this method allows the user to search against the database of users. The % symbols allows the "search" or the entered query to be just a fraction of the name or email address of the user that is being searched for
    # def self.search(search)
    #     search_condition = "%" + search + "%"
    #     find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
    # end

    def self.search(query)
        where("name like ?", "#{query}")
    end 

    # this method allows the user to call in the exact size of the image that is desired for a particular instance of that image
    def avatar_url(size)
        self.avatar.url(size)
        # .gsub('s3.amazonaws.com/', 's3-us-west-2.amazonaws.com/')
    end

end
