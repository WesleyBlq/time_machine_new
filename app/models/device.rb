class Device < ActiveRecord::Base

  def self.device_state
    find_by(no: '20180001').state
  end
  
  def self.open_device account
    instance = find_by(no: '20180001')
    instance.state = "openend"
    instance.owner = account
    instance.save
  end
  
  def self.close_device account
    instance = find_by(no: '20180001')

    if instance.owner.present? and instance.owner == account
      instance.state = "closeend"
      instance.save
      return true 
    end
    false
  end
  
  def self.idle_device
    instance = find_by(no: '20180001')
    instance.state = "idleend"
    instance.owner = ""
    instance.save
  end

  def self.owner
    find_by(no: '20180001').owner
  end

end
