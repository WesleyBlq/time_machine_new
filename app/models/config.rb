class Config < ActiveRecord::Base

  def self.device_state
    
    find_by(config_type: 'device').config_value
  end
  
  def self.open_device account
    instance = find_by(config_type: 'device')
    instance.config_value = "openend"
    instance.save

    instance = find_by(config_type: 'device_owner')
    instance.config_value = account
    instance.save
    # byebug
  end
  
  def self.close_device account
    instance = find_by(config_type: 'device_owner')

    if instance.config_value == account
      instance = find_by(config_type: 'device')
      instance.config_value = "closeend"
      instance.save
      return true 
    end
    false
  end
  
  def self.idle_device
    instance = find_by(config_type: 'device')
    instance.config_value = "idleend"
    instance.save

    instance = find_by(config_type: 'device_owner')
    instance.config_value = ""
    instance.save
  end

  def self.device_owner
    find_by(config_type: 'device_owner').config_value
  end
  
end
