class Page < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  attr_accessible :title, :body, :slug
end