class Post < ApplicationRecord
  validates :title, :user_id, :sub_id, presence: true

  belongs_to :user
  belongs_to :sub
end
