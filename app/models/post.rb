class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :blog_post, presence: true

  def formatDate
    time.strftime('%B %m %Y')
  end

end
