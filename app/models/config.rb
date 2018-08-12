class Config < ActiveRecord::Base

  def self.device_state
    
    find_by(config_type: 'device').config_value
  end
  
end
