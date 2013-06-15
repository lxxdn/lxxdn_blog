class ModifyPostTittleToTitle < ActiveRecord::Migration
  def up
  	rename_column :posts, :tittle, :title
  end

  def down
  	rename_column :posts, :title, :tittle
  end
end
