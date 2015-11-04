class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  belongs_to :board
  has_many :themes, through :quotes
end
