class TopController < ApplicationController
  def main
    # session[:login_uid] が存在していれば main.html.erb、無ければ login.html.erb を表示
    if session[:login_uid]
      render "main"
    else
      render "login"
    end
  end

  def login
    # フォームから送られた params[:uid] と params[:pass] をチェック
    if params[:uid] == "kindai" && params[:pass] == "sanriko"
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error"
    end
  end
end