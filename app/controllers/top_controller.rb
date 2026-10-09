class TopController < ApplicationController
  def main
    if session[:login_uid]
      render "main"
    else
      render "login"
    end
  end

  def login
    # ユーザーをDBから検索
    user = User.find_by(uid: params[:uid])

    # ユーザーが存在し、かつ BCrypt で入力パスワードと保存ハッシュを比較
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = user.uid
      redirect_to top_main_path
    else
      render "error"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end