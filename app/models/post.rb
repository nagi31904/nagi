class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :post_category_posts
  has_many :post_categories, :through => :post_category_posts
  belongs_to :user
  has_many :likes
  has_many :like_users, :through => :likes, :source => :user

  def finy_like_by(user)
    if user == nil

    else
      self.likes.find_by_user_id(user.id)
    end
  end
end
