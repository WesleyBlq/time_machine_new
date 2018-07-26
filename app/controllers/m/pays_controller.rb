class M::PaysController < M::BaseController
  layout 'mobile'
  # before_action :wechat_login?
  
  def index
  end

  def charge
  end

  def check
  end

  def history
  end

  def binding
    @user_info = WechatUser.current_user
  end

  def recived_binding 
    reg = /^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$/
    phone = reg.match(params[:phone])
    repeat_phone = reg.match(params[:repeat_phone])

    if !phone.present? or !repeat_phone.present?
      session[:bingding_error_message] = "请输入正确的手机号码"
      return redirect_to error_m_pays_path
    end

    if phone != repeat_phone
      session[:bingding_error_message] = "手机号码不一致"
      return redirect_to error_m_pays_path
    end  
    user = WechatUser.find_by(openid: session[:openid])
    user.alipay_acount = phone
    user.save!
    redirect_to success_m_pays_path  
  end

  def dev_op
  end

  def success
  end

  def error
  end
end