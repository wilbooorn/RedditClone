class PostSub < ApplicationRecord
  validates :sub, :post, presence: true

  belongs_to :post
  belongs_to :sub

end
