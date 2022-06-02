class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
        #親子関係でネストしたURLを作成することでparams[:post_image_id]でPostImageのidが取得できる
    favorite = PostImage.new
    favorite.user.id = current_user.id
    favorite.save
    redirect_to post_image_path(post_image)
  end 
    
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
  
end
