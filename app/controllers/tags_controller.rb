class TagsController < ApplicationController
	def show
		@tag_name = request.url.split('/').last 
		@tag = Tag.find_by_title(@tag_name)
		@archives = @tag.posts.order('created_at DESC')
	end
end
