require 'spec_helper'

describe UserFriendshipsController, :type => :controller do

  describe "POST create" do
        describe "successful create" do
            before do
                @user_1 = User.create!(name: "Maggie Smith", email: "maggz@yahoo.com", password: "smithmagick", password_confirmation: "smithmagick")
                @user_2 = User.create!(name: "Lauren Sanford", email: "laurnie@gmail.com", password: "yippeeday", password_confirmation: "yippeeday")
                @current_user = @user_1
            end

            subject {@user_1 }
            it { should be_valid }

            subject {@user_2 }
            it { should be_valid } 
        
            it "should build a friendship between @user_1 and @user_2" do
                expect do
                    post :create, id: 
                end.to change(UserFriendship, :count).by(1)
            end

            it { should redirect_to(user_path(current_user)) }
        end

        describe "with unsuccessful create" do

        end
    end


end
