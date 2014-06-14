require 'spec_helper'

describe User do
  before do
    @user = User.create!(name: "home dawg", email: "dawgie@snoop.com", password: "yuckie")
  end

     it "should be valid with a name, email, and password" do
        expect(@user).to be_valid
    end

    it "should be invalid without a name" do
        @user.name = nil
        expect(@user).to be_invalid
    end

    it "should be invalid without an email" do
        @user.email = nil
        expect(@user).to be_invalid
    end

    it "should be invalid without a password" do
        @user.password = nil
        expect(@user).to be_invalid
    end

    it "should have an email of the proper format" do
        @user2 = User.new(name: "home dawg", email: "dogdogdog.com", password: "yuckie")
        @user2.save
        expect(@user2).to_not be_persisted
    end

    it "should have a unique email" do
        @user3 = User.new(name: "serious mike", email: "dawgie@snoop.com", password: "quesoplease")
        @user3.save
        expect(@user3).to be_invalid
    end

    it "should have a unique name" do
        @user4 = User.new(name:"home dawg", email: "topdawg@bigdawg.com", password: "kingofdawgs")
        @user4.save
        expect(@user4).to be_invalid
    end

end
