class Theme < ActiveRecord::Base
  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :boards
  has_and_belongs_to_many :users
end
