require 'spec_helper'

describe UserFriendshipsController, :type => :controller do

    describe "POST create" do
        describe "successful create" do
            before do
                @user_1 = User.create!(name: "Maggie Smith", email: "maggz@yahoo.com", password: "smithmagick", password_confirmation: "smithmagick")
                @user_2 = User.create!(name: "Lauren Sanford", email: "laurnie@gmail.com", password: "yippeeday", password_confirmation: "yippeeday")
                controller.stub(:current_user) { @user_1 }
            end

            subject {@user_1 }
            it { should be_valid }

            subject {@user_2 }
            it { should be_valid } 
        
            it "should build a friendship between @user_1 and @user_2" do
                expect do
                    post :create, friend_id: @user_2
                end.to change(UserFriendship, :count).by(1)
            end

           it "should redirect the user to their user page" do
                post :create, friend_id: @user_2
                expect(response).to redirect_to user_path(@user_1)
           end
        end
    end
end
