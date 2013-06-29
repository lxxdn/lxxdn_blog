class PostsController < ApplicationController
  include PostHelper
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
      Tag.save_tags post, params[:post][:tags]
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
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    attribut_hashmap = params[:post]
    tags_string = attribut_hashmap[:tags]
    update_tags_for_a_post @post, tags_string
    attribut_hashmap.delete(:tags)
    @post.update_attributes(attribut_hashmap)
    render 'show'
  end

  def archives
    @archives = Post.order('created_at DESC')
  end


end
