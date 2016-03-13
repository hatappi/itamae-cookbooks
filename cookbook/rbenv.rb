script_dir =  File.expand_path(File.dirname(__FILE__))

execute 'apt-get-upgrade' do
  command 'sudo apt-get upgrade -y'
end

# 最低限必要なパッケージをインストール
package 'gcc'
package 'libssl-dev'
package 'libreadline-dev'
package 'zlib1g-dev'
# package 'zlib-devel'
# package 'libxml2'
# package 'libxml2-devel'
# package 'libxslt'
# package 'libxslt-devel'
package 'git'
package 'bzip2'
package 'make'
# package 'mysql-devel'

execute 'rbenv chown' do
  command "sudo chown #{node[:user]}:#{node[:user]} -R #{node[:rbenv][:root_dir]}"
end


# 起動スクリプトの配置
template node[:rbenv][:script_filepath] do
  action :create
  owner node[:user]
  group node[:user]
  mode '0644'
  source "#{script_dir}/../template/rbenv.sh.erb"
  variables(rbenv_root: node[:rbenv][:root_dir])
end

git node[:rbenv][:root_dir] do
  repository 'git://github.com/sstephenson/rbenv.git'
end

git "#{node[:rbenv][:root_dir]}/plugins/ruby-build" do
  repository 'git://github.com/sstephenson/ruby-build.git'
end

execute "install ruby #{node[:rbenv][:ruby_version]}" do
  command "source #{node[:rbenv][:script_filepath]}; rbenv install #{node[:rbenv][:ruby_version]}"
  not_if "source #{node[:rbenv][:script_filepath]}; rbenv versions | grep #{node[:rbenv][:ruby_version]}"
end

execute "set global ruby #{node[:rbenv][:ruby_version]}" do
  command "source #{node[:rbenv][:script_filepath]}; rbenv global #{node[:rbenv][:ruby_version]}; rbenv rehash"
  not_if "source #{node[:rbenv][:script_filepath]}; rbenv global | grep #{node[:rbenv][:ruby_version]}"
end
