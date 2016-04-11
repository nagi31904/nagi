class WorkPost < ActiveRecord::Base
  has_many :work_category_posts
  has_many :work_categories, :through => :work_category_posts
end
