class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.user_id = current_user.id
    comment.save
  end
  
  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
  end  
  
  def update
    @comment.reload unless @comment.update(comment_update_params)
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
  def comment_update_params
    params.require(:comment).permit(:comment)
  end
end
