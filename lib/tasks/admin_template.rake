

namespace :admin_template do
  desc 'migrate'
  task :migrate do
    # puts "cp -r #{Dir.pwd}/lib/admin_template/template/controllers/admin  #{Dir.pwd}/app/controllers/"
    src_path = "#{Dir.pwd}/lib/admin_template/template/"
    dst_path = "#{Dir.pwd}/app/"
    sh "cp -r #{src_path}  #{dst_path}"
  end
end
