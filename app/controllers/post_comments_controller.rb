class PostCommentsController < ApplicationController
  
  def create #親子関係によってインスタンス変数で呼び出す必要がない？
    post_image = PostImage.find(params[:post_image_id])
    #親子関係でネストしたURLを作成することでparams[:post_image_id]でPostImageのidが取得できる
    #投稿するため空のカラムが必要
    comment = PostComment.new(post_comment_params) #投稿するため空のカラムが必要
    comment.user_id = current_user.id 
    #1文でまとめると comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end 
  
  def destroy
    PostComment.find(params[:id]).destroy #コメントのidを削除するため
    redirect_to post_image_path(params[:post_image_id]) #コメントを削除した投稿画像の詳細画面へ
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end 
  
end
