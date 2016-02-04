class User < ActiveRecord::Base
  has_secure_password

  has_many :posts

  validates :email, confirmation: true

  validates :first_name, :last_name, presence: true, length: {minimum: 3}

end
