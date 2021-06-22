class AdminBlogComment < ApplicationRecord
  belongs_to :admin
  belongs_to :blog
end
