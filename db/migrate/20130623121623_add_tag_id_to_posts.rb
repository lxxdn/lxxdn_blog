class AddTagIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tag_id, :string
  end
end
