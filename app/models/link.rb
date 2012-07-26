class Link < ActiveRecord::Base
  attr_accessible :user_id, :title, :url

  validates :url, :uniqueness => true
  validate :within_allowed_time

  belongs_to :user

  has_reputation :votes, source: :user, aggregated_by: :sum

  has_many :comments, :as => :commentable

  def within_allowed_time
    if self.created_at < Time.now - 15.minutes
      errors.add(:error, "Can't edit past 15 minutes")
    end unless self.created_at.nil?
  end
end
