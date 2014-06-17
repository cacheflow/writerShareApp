class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(comment_params)
  	@comment.version_id = params[:version_id]
  	@comment.save
  	redirect_to user_versions_path(@comment.version)

  end

  def index
  end
end







class CommentsController < ApplicationController

def create 
	@comment = Comment.new(comment_params)
	@comment.article_id = params[:article_id]

	@comment.save

	redirect_to article_path(@comment.article)
end 

def index 
	@comments = Comment.all
end 

def comment_params 
	params.require(:comment).permit(:author_name, :body)

end 




end
