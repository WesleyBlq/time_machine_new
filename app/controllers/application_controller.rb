class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  self.wechat_gate_app_name = 'nanyang_recycle'
  
  def current_user
      WechatUser.find_by(openid: session[:openid]) 
  end
end
