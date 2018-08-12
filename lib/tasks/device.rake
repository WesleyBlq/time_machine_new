

namespace :device do
  desc 'seed'
  task :seed => :environment do
    # Config.create(config_type: :device, config_value: "idleend")
    Config.create(config_type: :device_owner, config_value: "")

  end
end
