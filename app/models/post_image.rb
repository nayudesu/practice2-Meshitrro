class PostImage < ApplicationRecord
  has_one_attached :image #画像投稿できるようにする
  belongs_to :user
end
