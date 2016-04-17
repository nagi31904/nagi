class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :like_posts, :through => :likes, :source => :post

  has_many :friendships
  has_many :friends,:through => :friendships

  has_many :anti_friendships,:class_name => "Friendship",:foreign_key => "friend_id"
  has_many :anti_friends, :through => :anti_friendships,:source=>:users


  def display_name
    email.split("@").first
  end
end
