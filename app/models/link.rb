class Link < ActiveRecord::Base
  attr_accessible :author_id, :title, :url

  validates :url, :uniqueness => true
end
