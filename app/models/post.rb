class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  has_and_belongs_to_many :boards
  has_many :themes, through :quotes
end
