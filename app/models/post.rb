class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :blog_post, presence: true

  def self.show_format
    all.order(created_at: :desc).reject{ |post_last| post_last == Post.last}
  end
  

end
