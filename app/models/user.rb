class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile
  has_many :blog_comments, dependent: :destroy
  validates :name, presence: true
  validates :profile, presence: true
end
