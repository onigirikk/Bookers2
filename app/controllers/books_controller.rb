class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to book_path(@book.id)
    else
       @user = current_user
       @books = Book.all
       render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id]) 
    @user = @books.user
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
   if @books.update(book_params)
    flash[:notice] ="You have update book successfully."
    redirect_to book_path(@books.id)
   else
    render :edit
   end
  end
  
  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user == current_user
      redirect_to books_path
    end
  end
  
end