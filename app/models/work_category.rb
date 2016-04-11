class WorkCategory < ActiveRecord::Base
  has_many :work_category_posts
  has_many :work_posts, :through => :work_category_posts
end
