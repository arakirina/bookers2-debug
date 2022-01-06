class BookCommentsController < ApplicationController

  def create
    @showbook = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @showbook.id
    @book_comment.save
  end

  def destroy
    @showbook = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(id: params[:id])
    @book_comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
