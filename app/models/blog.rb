class Blog < ApplicationRecord
  attachment :image
  belongs_to :admin
  has_many :blog_comments, dependent: :destroy
  has_many :admin_blog_comments, dependent: :destroy
end
