class WechatUser < ActiveRecord::Base
  validates :openid, uniqueness: true
  has_many :bills

  def current_user
    WechatUser.find_by(openid: session[:openid])
  end

end
