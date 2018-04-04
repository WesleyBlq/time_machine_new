# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Tim-Machine'
set :deploy_to, "/www/time_machine"
# set :deploy_to, "/disk1/www/family"

# need to set the user 'deploy' ssh key
set :repo_url, 'git@github.com:taotaochanghe/time_machine_new.git'
set :scm, :git
# set :scm_username, "buildsystem"
# set :scm_passphrase, "iambuildmachine"
set :branch, ENV['BRANCH'] || "master"
set :default_env, {
  'RAILS_MASTER_KEY' => "12c0ac93620582818f8462542d4c3164",
  'NODE_ENV' => "production"
}


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

# set :rvm1_map_bins, %w{rake gem bundle ruby}

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

