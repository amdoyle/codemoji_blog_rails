class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :blog_post, presence: true
end
