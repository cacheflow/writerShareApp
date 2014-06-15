require 'spec_helper'

describe UsersController, type: :controller do
    let :valid_attributes do
        {
            name: "James Milani",
            email: "james@james.com",
            password: "ilovecheese",
            password_confirmation: "ilovecheese",

        }
    end

    let :invalid_attributes do
        {
            name: "James Milani",
            email: "james.com",
            password: "ilovecheese",
            password_confirmation: "ilovecheese"
        }
    end

    describe "GET index" do
        let! :user_1 do
            User.create! valid_attributes
        end

        before do
            get :index
        end

        it "should render the index page" do
            expect(response).to render_template :index
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200) 
        end

        it "should render the set of users" do
            expect(assigns(:users)).to include(user_1)
        end
    end

    describe "GET new" do
        before do
            get :new
        end

        it "should render the new_user/signup page" do
            expect(response).to render_template :new
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200)
        end
    end

    describe "POST create" do

        it "should create a user in the database" do
            expect do
                post :create, user: valid_attributes
            end.to change(User, :count).by(1)
        end

        it "should redirect to the user index" do
            post :create, user: valid_attributes
            expect(response).to redirect_to users_path
        end

        it "should render the new user page if user's attributes are invalid" do
            post :create, user: invalid_attributes
            expect(response).to render_template :new
        end

    end

    describe "GET show" do
        before do
            @user = User.create! valid_attributes
            get :show, id: @user.id
        end

        it "should render the show page for a user" do
            expect(response).to render_template :show
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200)
        end

        it "should assign user to be a user" do
            expect(assigns(:user)).to eq(@user)
        end

    end

    describe "GET edit" do
        before do
            @user = User.create! valid_attributes
            get :edit, id:@user.id
        end

        it "should render the edit page for a user" do
            expect(response).to render_template :edit
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200)
        end

        it "should assign user to be user that will be edited" do
            expect(assigns(:user)).to eq(@user)
        end
    end

    describe "PUT update" do
        before do
            @user = User.create! valid_attributes
        end

        describe "with a successful update" do
            let :update_attributes do
                {
                    name: "James Milani",
                    email: "James@superjames.com",
                    password: "ilovecheese",
                    password: "ilovecheese"
                }
            end

            before do
                put :update, id: @user.id, user: update_attributes
            end

            it "should update the user in the database to have the new attributes" do
                
            end

            it "should" do

            end
        end

        describe "with an unsuccessful update" do
            it "should" do

            end

            it "should" do

            end
        end
    end

    
 end