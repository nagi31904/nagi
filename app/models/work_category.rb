class WorkCategory < ActiveRecord::Base
  has_many :work_category_posts
  has_many :work_posts, :through => :work_category_posts

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

end
