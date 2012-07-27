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

  def toggle_invisibility
    if self.invisible.nil?
      self.invisible = true
    else
      self.invisible = !self.invisible
    end
  end

  def update_title_and_url(params)
    self.title = params[:link][:title]
    self.url = params[:link][:url]
  end
end
