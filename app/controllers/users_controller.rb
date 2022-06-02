class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #表示したいuserのidを取り出す
    @post_images = @user.post_images #アソシエーションを持っているモデル同士が可能
    #@userに関連付けられた投稿全て（.post_images）を取得する＝個人が投稿したもの全てを表示できる
  end

  def edit
    @user = User.find(params[:id]) #編集したいuserのidを取り出す
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end 
  #editとupdateはセット
  
  private
  
  def user_params
    params.require(:user).permit(:name, ::profile_image)
  
  
end
