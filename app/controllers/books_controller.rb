class BooksController < ApplicationController
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to books_path
    else
      render :show
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.all
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
   if @books.update(book_params)
    flash[:notice] ="You have update book successfully."
    redirect_to books_path(params[:id])
   else
    render :edit
   end
  end
  
  def destroy
    @books = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end