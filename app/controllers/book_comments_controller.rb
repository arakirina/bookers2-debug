class BookCommentsController < ApplicationController

  def create
    @showbook = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @showbook.id
    if @book_comment.save
      redirect_to book_path(@showbook)
    else
      @user = @showbook.user
      @book = Book.new
      render "books/show"
    end

  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
