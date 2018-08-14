class M::PaysController < M::BaseController

  layout 'mobile'
  
  before_action :wechat_login?
# before_action :wechat_login? unless Rails.env == "development"
  
  def index
  end

  def charge
  end

  def check
  end

  def history
  end

  def binding
    # byebug
    @user_info = current_user
    # @user_info = current_user || WechatUser.find_by(openid: "og-gC04UkyQ05BVZXuDns3JmH1n0")
  end

  def recived_binding 
    reg = /^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$/
    phone = reg.match(params[:phone])
    repeat_phone = reg.match(params[:repeat_phone])

    if !phone.present? or !repeat_phone.present?
      session[:bingding_error_message] = "请输入正确的手机号码"
      return render :json => { state: "error", message: "请输入正确的手机号码" }
      # return redirect_to error_m_pays_path
    end

    if phone != repeat_phone
      session[:bingding_error_message] = "手机号码不一致"
      return render :json => { state: "error", message: "手机号码不一致" }
      # return redirect_to error_m_pays_path
    end  

    user = WechatUser.find_by(openid: session[:openid])
    user.alipay_acount = phone
    user.save!
    render :json => { state: "ok", message: "保存成功"}
    # redirect_to success_m_pays_path  
  end

  def dev_op
    @device_state = Device.device_state
  end

  def dev_ajax
    case params[:op]
    when "open"
      Device::open_device current_user.alipay_acount
    when "close"
      Device::close_device current_user.alipay_acount
    end
    redirect_to dev_op_m_pays_path
  end
  

  def success
  end

  def error
  end
end