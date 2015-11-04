class Creator < ActiveRecord::Base
  has_many :quotes
  has_many :sources
end
