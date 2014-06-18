require 'spec_helper'

describe CommentsController type: :controller do 
  let :valid_attributes do 
    { 
      user_name: "Lex"
      body: "something something text needs to look like this"
      



    }

end 


describe "GET Index" do 
  let! :user_name do 
    Comment.create! valid_attributes
  end 

  before do 
    get :index
  end 

  it "should render the index page" do 
    expect(response).to render_template :index
  end 

  it "should succeed with status code 200" do 
    expect(response).to eq(200)
  end 

  it "should show all of the comments" do 
    expect(assigns(:comments)).to include(comment_1)
  end 
end 