class User < ApplicationRecord
  validates :email, presence: true

  has_secure_password


  def welcome
    "hello, #{self.email}"
  end
end
