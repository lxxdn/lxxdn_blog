class PostsController < ApplicationController
  def index
  	user = User.find_by_admin(true)
  	if user && user.posts.size > 0
  		@posts = user.posts
  	end 
  end

  def new
  	@post = Post.new
  end

  def create
  	title = params[:post][:title]
  	content = params[:post][:content]
  	post = current_user.posts.build(title: title, content: content)
  	if post.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end
end
