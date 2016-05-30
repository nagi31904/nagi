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
  has_many :anti_friends, :through => :anti_friendships,:source=>:user

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  def display_name
    email.split("@").first
  end
end
