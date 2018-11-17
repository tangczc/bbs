class CommentsController < ApplicationController
	def create
	  c = Comment.new(comment_params)
	  c.save
	  redirect_to c.issue
	end

	private
	  def comment_params
	  	params.require(:comment).permit(:issue_id, :user_id, :content)
	  end
end
