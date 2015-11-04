class Source < ActiveRecord::Base
  has_many :quotes
  belongs_to :creator
end
