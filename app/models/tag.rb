class Tag < ActiveRecord::Base
   attr_accessible :title

   has_and_belongs_to_many :posts

   validates :title, presence: true, uniqueness: true

   public
  	def self.save_tags (post, tags_title_list)
  		tags_title_array = tags_title_list.split(',')

  		tags_title_array.each do |tag_title|
  			 if tag_model = Tag.find_by_title(tag_title)
            post.tags << tag_model
          else
             post.tags.create(title: tag_title) 
         end 

  		end
  	end

end
