class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :post_category_posts
  has_many :post_categories, :through => :post_category_posts
  belongs_to :user

end
