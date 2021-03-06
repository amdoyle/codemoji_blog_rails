class Comment < ActiveRecord::Base
  belongs_to :post

  belongs_to :user

  def format_date
    created_at.strftime("%B %d,%y at %l:%M %p")
  end

end
