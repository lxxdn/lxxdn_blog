class Tag < ActiveRecord::Base
   attr_accessible :title

   has_and_belongs_to_many :posts

   validates :title, presence: true, uniqueness: true

   public
  	def self.save_tags (post, tags_list)
  		tags_array = tags_list.split(',')

  		tags_array.each do |tag|
  			post.tags.create(title: tag) unless Tag.find_by_title(tag)
  		end
  	end

end
