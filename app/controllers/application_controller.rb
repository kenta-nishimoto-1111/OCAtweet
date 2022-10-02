class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # サインアップ時に入力する情報はパラメーターとしてサーバーに送信されます。
  # 通常のリクエストの場合は、コントローラーに記述してあるストロングパラメーターで受け取れるパラメーターを制限します。
  # しかし、deviseでログイン機能を実装した場合のパラメーターの受け取り方は通常とは異なります。
  # ログイン時に送られてくるパラメーターを制限するストロングパラメーターは、deviseのGem内に記述されているため編集することはできません。
  # なので、devise が提供しているconfigure_permitted_parametersメソッドというメソッドを使用する必要があります。

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
