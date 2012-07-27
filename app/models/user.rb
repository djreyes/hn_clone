class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :links

  has_many :comments, :as => :commentable

  # active record reputations system
  # has_many :evaluations, class_name: "RSEvaluation", as: :source

  # has_reputation :link_votes, source: {reputation: :votes, of: :links}, aggregated_by: :sum
  #
  # has_reputation :comment_votes, source: {reputation: :votes, of: :comments}, aggregated_by: :sum

  # def voted_for?(link)
  #   evaluations.where(target_type: link.class, target_id: link.id).present?
  # end

  has_reputation :karma, source: [{reputation: :votes, of: :links}, {reputation: :votes, of: :comments}], aggregated_by: :sum

  def ban_status(params)
    if params[:banned] == "banned"
      self.banned = true
    elsif params[:banned] == "unbanned"
      self.banned = false
    end
  end

  def admin_status(params)
    if params[:admin] == "admin"
      self.admin = true
    elsif params[:admin] == "de-admin"
      self.admin = false
    end
  end

end
