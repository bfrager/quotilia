class Quote < ActiveRecord::Base
    has_and_belongs_to_many :users
    belongs_to :creator
    has_and_belongs_to_many :themes
    has_many :posts
    belongs_to :source

    accepts_nested_attributes_for :creator
    accepts_nested_attributes_for :source

    # calendar :through example:
    # has_many :event_users
    # has_many :active_event_users, -> { where active: true }, class_name: 'EventUser'
    # has_many :active_events, :through => :active_event_users, class_name: 'Event', :source => :event
end
