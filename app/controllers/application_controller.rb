class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # application_controller.rbに「:authenticate_user!」を設定しているのでどのページでもログインしていないとログインページに飛ばされる。もし、ログインが必要なページと必要じゃないページを分けたいのなら、ログインが必要なページに都度[before_action :authenticate_user!]を書くか、２つ目のアプリケーションコントローラーを作ってそこにapplication_controllerを継承、authenticate~を記述し、必要なコントローラーに継承する形でもいいかもしれない。
  before_action :authenticate_user!, except: [:index, :top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先のパスを指定
  def after_sign_in_path_for(resource)
    top_path
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

end
