class PostsController < ApplicationController
  def index
  	user = User.find_by_admin(true)
  	if user && user.posts.size > 0
  		@posts = user.posts
  	end 
  end
end
