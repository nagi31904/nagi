class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true ,:touch => true
  belongs_to :user
end
