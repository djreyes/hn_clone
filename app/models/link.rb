class Link < ActiveRecord::Base
  attr_accessible :user_id, :title, :url

  validates :url, :uniqueness => true

  belongs_to :user
end
