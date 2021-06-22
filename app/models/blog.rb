class Blog < ApplicationRecord
  attachment :image
  belongs_to :admin
  has_many :blog_comments, dependent: :destroy
end
