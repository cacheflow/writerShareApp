require 'spec_helper'

describe SessionsController, type: :controller do
    
    describe "POST create" do

        before do
            @joe = User.create!(name: "Joe", email: "joe@joe.com", password: "thisishard", password_confirmation: "thisishard")
            post :create, session: :remember_token
        end


        it "should return the user object" do
            expect("joe@joe.com").to eq(@joe)
        end


            it { should redirect_to(users_path)}


    end
end
