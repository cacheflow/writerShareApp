require 'spec_helper'

describe SessionsController, type: :controller do
    
    describe "POST create" do
        describe "on successful signin"do
            before do
                @joe = User.create!(name: "Joe", email: "joe@joe.com", password: "thisishard", password_confirmation: "thisishard")
                post :create, session: { :email => @joe.email, :password => @joe.password }
            end

            it "should return that joe is valid" do
                expect(@joe).to be_valid
            end

            it "should return the user's email" do
                expect(assigns[:user]).to eq(@joe)
            end

            it "should authenticate the user with a proper email and password combination" do
                expect(session[:remember_token]).to eq(@joe.id)
            end

            it "should set the current user to be user that is logging in" do
                expect(assigns[:current_user]).to eq(@joe)
            end

            it "should redirect to the users' index page" do
                expect(response).to redirect_to users_path
            end
        end

        describe "on unsuccessful signin" do
            before do
                @joe = User.create!(name: "Joe", email: "joe@joe.com", password: "thisishard", password_confirmation: "thisishard")
                @matt = User.create!(name: "Matt", email: "matt@matt.com", password: "easyeasy", password_confirmation: "easyeasy")
                post :create, session: { :email => @joe.email, :password => @matt.password }
            end
            
            it "should return joe as the user by his email" do
                expect(assigns[:user]).to eq(@joe)
            end

            it "should not authenticate joe as the user because he is using the wrong password" do
                expect(session[:remember_token]).to eq(nil)
            end

            it "should render the new sessions page" do
                expect(response).to render_template :new
            end
        end
    end
end
