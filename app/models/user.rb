class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :themes
  has_many :boards
  has_many :posts

end
