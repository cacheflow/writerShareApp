require 'spec_helper'

describe UsersController do
    let :valid_attributes do
        {
            name: "James Milani",
            email: "james@james.com",
            password: "ilovecheese",
            password_confirmation: "ilovecheese",

        }
    end

    describe "GET index" do
        let! :user_1 do
            User.create! valid_attributes
        end

        it "should render the index page" do
            expect(response).to render_template :index
        end

        it " " do

        end

    end

 end