class BookCommentsController < ApplicationController
  def create
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
    redirect_to request.referer
  end
  
  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end 
  
  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
