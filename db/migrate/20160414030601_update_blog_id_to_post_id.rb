class UpdateBlogIdToPostId < ActiveRecord::Migration
  def change
    remove_column :comments, :blog_id
    add_column :comments, :user_id, :integer
  end
end
