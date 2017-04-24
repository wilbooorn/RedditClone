class Post < ApplicationRecord
  validates :title, :user_id, :sub_ids, presence: true

  belongs_to :user
  # belongs_to :sub

  has_many :post_subs, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments
end
