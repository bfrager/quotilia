class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  has_and_belongs_to_many :boards
  # has_many :themes, through :quotes

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
