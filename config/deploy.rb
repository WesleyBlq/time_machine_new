# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Tim-Machine'
set :deploy_to, "/www/time_machine"
# set :deploy_to, "/disk1/www/family"

# need to set the user 'deploy' ssh key
set :repo_url, 'git@github.com:taotaochanghe/Time-Machine.git'
set :scm, :git
# set :scm_username, "buildsystem"
# set :scm_passphrase, "iambuildmachine"
set :branch, ENV['BRANCH'] || "master"
# set :default_env, {
#   'BUNDLE_PATH' => "/home/ubuntu/.rvm/gems/ruby-2.2.5/bin/bundle"
# }

# set :default_env, {
#   'PATH' => "/home/ubuntu/.rvm/rubies/ruby-2.2.4/bin:/home/ubuntu/.rvm/gems/ruby-2.2.4@ubuntu/bin/bundle:$PATH",
#   'RUBY_VERSION' => 'ruby 2.2.4',
#   'GEM_HOME'     => '/home/ubuntu/.rvm/rubies/ruby-2.2.4/bin/gem',
#   'GEM_PATH'     => '/home/ubuntu/.rvm/rubies/ruby-2.2.4/bin/gem',
#   'BUNDLE_PATH'  => '/home/ubuntu/.rvm/gems/ruby-2.2.4@ubuntu/bin/bundle'  # If you are using bundler.
# }

# setup rbenv.
# set :rbenv_type, :system
# set :rbenv_ruby, '2.2.4'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rvm1_map_bins, %w{rake gem bundle ruby}

# set :rvm_type, :user
# set :rvm_ruby_string, '2.2.4@ubuntu'
# set :rvm_autolibs_flag, "read-only"
set :keep_releases, 5

set :rails_env, ENV['RAILS_ENV'] || ENV['rails_env']

set :linked_files, fetch(:linked_files, []).concat(%w[
])
set :linked_dirs, fetch(:linked_dirs, []).concat(%w[
  log
  tmp
  public/system
])
# set :rvm1_map_bins,   -> { fetch(:rvm_map_bins, %w{rake gem bundle ruby}) }
set :pty, true
set :use_sudo, false
set :deploy_via, :remote_cache # or :copy

set :log_level, :debug
# Default value for default_env is {}
# set :default_env, { path: "/home/ubuntu/.rvm/rubies/ruby-2.2.4/bin:$PATH" }

# deploy flow: http://capistranorb.com/documentation/getting-started/flow/
# before "deploy:compile_assets", "deploy:cleanup_assets"
# after "deploy:finished", "deploy:unicorn:reload"

# from capistrano3-unicorn gem
set :unicorn_config_path, "config/unicorn.rb"
# set :unicorn_options, "-E #{fetch(:rails_env)} -D"

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    # invoke 'unicorn:legacy_restart'
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end

# TEST
desc "check we can access everything"
task :check_write_permission do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

