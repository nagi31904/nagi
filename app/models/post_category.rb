class PostCategory < ActiveRecord::Base
  has_many :post_category_posts
  has_many :posts, :through => :post_category_posts
end
