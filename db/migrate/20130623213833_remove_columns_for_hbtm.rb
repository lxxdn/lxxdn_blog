class RemoveColumnsForHbtm < ActiveRecord::Migration
  def change
  	remove_column :posts, :tag_id
  	remove_column :tags, :post_id
  end

end
