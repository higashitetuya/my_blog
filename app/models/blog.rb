class Blog < ApplicationRecord
  attachment :image
  belongs_to :admin
end
