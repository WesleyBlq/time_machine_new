class WechatUser < ActiveRecord::Base
  validates :openid, uniqueness: true
  has_many :bills

end
