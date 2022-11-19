class BooksController < ApplicationController
  skip_forgery_protection
  # アプリケーションを完成させよう＞2章＞
  # 投稿フォームを作成する
  def index
    @book = Book.new
    @user = current_user
    @books = @user.books
  end
  
  # ア＞2章＞
  # 保存機能を追加する
  def create
    # book = book.new(book_params)
    # book.save
    # redirect_to 'books/(current_user.id)'
    
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice] = "You have created book successfully."
    else
     render :index
    end
  end
  

  def show
    @book = Book.new
    @book_image = Book.find(params[:id])
  end

  # A33
  # ア・２＞16章
  def edit
    @book = Book.find(params[:id])
  end
  
  # A34
  # ア＞5章
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
     flash[:notice] = "You have updated book successfully."
    else
     render :edit
    end
  end
  
  # A30
  # ア・2＞13章
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
