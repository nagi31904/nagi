class WorkPost < ActiveRecord::Base
  has_many :work_category_posts
  has_many :work_categories, :through => :work_category_posts

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/



  def display_timezone

    created_at.to_s.split("+").first
  end
end
