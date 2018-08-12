

namespace :device do
  desc 'seed'
  task :seed => :environment do
    Config.create(config_type: :device, config_value: "idleend")

  end
end
