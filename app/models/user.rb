require 'bcrypt'

class User < ActiveRecord::Base
    belongs_to :user_friendship
    belongs_to :piece


    validates_presence_of :name, :email, :password, :password_confirmation
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    validates_uniqueness_of :email, :name


end
