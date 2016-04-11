class WorkCategoryPost < ActiveRecord::Base
  belongs_to :work_post
  belongs_to :work_category
end
