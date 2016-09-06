class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name, presence: true, length: {maximum: 50}
	has_many :photos
	has_many :friendships
	has_many :friends, through: :friendships
	has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
	has_many :inverse_friends, through: :inverse_friendships, source: :user
end
