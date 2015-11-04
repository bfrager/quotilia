class Quote < ActiveRecord::Base
    has_and_belongs_to_many :users
    belongs_to :creator
    has_and_belongs_to_many :themes
    has_many :posts
    belongs_to :source
end
