class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 #アソシエーション       
  has_many :post_images, dependent: :destroy #dependent: :destroy=1:Nの1側が削除されたとき、N側を全て削除する
  has_many :post_comments, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  
  has_one_attached :profile_image

  
  def get_profile_image(width, height) #16の引数指定
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    
    profile_image.variant(resize_to_limit: [width, height]).processed
    #variant(resize_to_limit: [width, height]).processedで画像のサイズ変更とを可能にする
  end
  
end 
