class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :post_category_posts
  has_many :post_categories, :through => :post_category_posts
  belongs_to :user
  has_many :likes
  has_many :like_users, :through => :likes, :source => :user


  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/





  def finy_like_by(user)
    if user == nil

    else
      self.likes.find_by_user_id(user.id)
    end
  end





  def display_timezone

    created_at.to_s.split("+").first
  end
end
