class Config < ActiveRecord::Base

  def self.device_state
    
    find_by(config_type: 'device').config_value
  end
  
  def self.open_device
    instance = find_by(config_type: 'device')
    instance.config_value = "openend"
    instance.save
  end
  
  def self.close_device
    instance = find_by(config_type: 'device')
    instance.config_value = "closeend"
    instance.save
  end
  
  def self.idle_device
    instance = find_by(config_type: 'device')
    instance.config_value = "idleend"
    instance.save
  end

end
