class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :blog
         has_many :blogs, dependent: :destroy
         has_many :admin_blog_comments, dependent: :destroy
end
