class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    # @user = User.find(params[:id])
    @user = current_user
  end

  # アプリケーションを完成させよう2＞15章＞
  # Controller
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    # if (条件)users/id番号/editのid番号がログインユーザーのとき
    #   (条件が満たされた場合の処理)プロフィール編集画面に遷移
    # else
    #  (条件が満たされない場合の処理) ログインユーザーの詳細画面に遷移
    # end
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
