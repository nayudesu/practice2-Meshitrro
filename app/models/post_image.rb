class PostImage < ApplicationRecord
  has_one_attached :image #画像投稿できるようにする
  belongs_to :user
  
  def get_image #get_imageメソッドはモデルの中に記述し、カラムを呼び出すようにこのメソッドを呼び出すことができる（名前的な）
    unless image.attached? #unless=画像の添付されていない場合・・・
      file_path = Rails.root.join('app/assets/images/no_image.jpg') #画像が設定されない場合はapp/assets/imagesに格納されているno_image.jpgを表示する
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg') #
    end
    
    image
  end 

end
