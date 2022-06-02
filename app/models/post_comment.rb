class PostComment < ApplicationRecord
  belongs_to :user #userとのアソシエーション
  belongs_to :post_image #post_imageとのアソシエーション
end
