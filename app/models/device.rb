class Device < ActiveRecord::Base
  belongs_to :user, optional: true, class_name: "WechatUser", foreign_key: "wechat_user_id"

  def self.device_state
    instance = find_by(no: '20180001')
    if instance.state == "closeend" and Time.now > instance.updated_at + 1.minutes
      instance.state = "idleend"
      instance.save

    if instance.state == "openend" and Time.now > instance.updated_at + 3.minutes
      instance.state = "idleend"
      instance.save
    end

    instance.state
  end
  
  def self.open_device user
    instance = find_by(no: '20180001')
    instance.state = "openend"
    instance.user = user
    instance.save
  end
  
  def self.close_device user
    instance = find_by(no: '20180001')

    if instance.user.present? and instance.user == user
      instance.state = "closeend"
      instance.save
      return true 
    end
    false
  end
  
  def self.idle_device
    instance = find_by(no: '20180001')
    instance.state = "idleend"
    instance.user = nil
    instance.save
  end

  def self.user
    find_by(no: '20180001').user
  end

end
