class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true ,:touch => true
  belongs_to :user
  def display_timezone

    created_at.to_s.split("+").first
  end
end
