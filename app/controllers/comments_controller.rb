class CommentsController < ApplicationController
  

  def create
  	# comment = Comment.new(params[:comment])
  	# comment.user_id = current_user.id
  	# if comment.save
  	
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "Comment succeed"
    else
      flash[:alert] = "Comment failed"
    end 
    redirect_to post_path(@comment.post_id)
  end
end
