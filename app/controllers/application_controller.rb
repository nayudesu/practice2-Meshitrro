class ApplicationController < ActionController::Base
#deviseコントローラーは直接変更できないため、ココに記述
  before_action :configure_permitted_parameters, if: :devise_controller?
#devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行(ストロングパラメーターと同様）

  protected #呼び出された他のコントローラから参照することが可能

  def after_sign_in_path_for(resource)
    #Deviseのメソッドでサインイン後にどこに遷移するかを設定+resource=???
    about_pat
  end
  
  def after_sign_out_path_for(resource)
    #サインアウト後にどこに遷移するかを設定
    about_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #configure_permitted_parameters=>devise_parameter_sanitizer.permit使い、sign_upの際に、nameのデータ操作を許可
  end
  
end
