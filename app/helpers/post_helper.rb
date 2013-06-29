module PostHelper
	def tags_to_string (tags)
		tag_names = []
		tags.each{ |t| tag_names << t.title}
		tag_names.join(",")
	end

	#tag_strings: "tag1,tag2,tag3"
	def update_tags_for_a_post (post, tag_strings)
		tag_names = tag_strings.split(",")
		tag_names.each do |tag_name| 
			if !Tag.find_by_title(tag_name)
				post.tags.create(title: tag_name)
			elsif !post.tags.find_by_title(tag_name)
					post.tags << Tag.find_by_title(tag_name)
			end
		end 
	end
end
