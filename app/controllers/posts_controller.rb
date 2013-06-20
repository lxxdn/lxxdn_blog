class PostsController < ApplicationController
  def index
		@posts = Post.order('created_at DESC')
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

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root
  end

  def archives
    @archives = Post.order('created_at DESC')
  end


end
