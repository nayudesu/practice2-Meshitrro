class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new #空のモデルを用意する
  end
  
  def create #投稿データを保存するためにcreateアクション
    @post_image = PostImage.new(post_image_params) 
    @post_image.user_id = current_user.id #Postモデルのカラム名より（左）user.id / current_userははdeviseのメソッドでログイン中のユーザーの情報を取得
    #@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
    @post_image.save
    redirect_to post_images_path
  end 

  def index
    @post_images = PostImage.all #PostImageモデル全ての投稿を表示
  end

  def show
    @post_image = PostImage.find(params[:id]) #findには必ず引数を入力する(params[:id])
    @post_comment = PostComment.new #親子関係にあるPosCommentを投稿するための空のカラム
  end
  
  def destroy
    @post_image = PostImage.find(params[:id]) #削除するレコードの取得
    @post_image.destroy
    redirect_to post_images_path
  end 
  
  
  private
  
  def post_image_params #ストロングパラメーター＝フォームで入力されたデータが、投稿データとして許可されているかをチェック
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end 
  
end
