class Link < ActiveRecord::Base
  attr_accessible :user_id, :title, :url

  validates :url, :uniqueness => true

  belongs_to :user

  has_reputation :votes, source: :user, aggregated_by: :sum
  
  has_many :comments, :as => :commentable
end
