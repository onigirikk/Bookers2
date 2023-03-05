class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    flash[:notice] ="You have update book successfully."
    redirect_to books_path(params[:id])
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