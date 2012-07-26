class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content, :user_id

  belongs_to :commentable, :polymorphic => true

  has_many :comments, :as => :commentable

  belongs_to :user

  has_reputation :votes, source: :user, aggregated_by: :sum
end
