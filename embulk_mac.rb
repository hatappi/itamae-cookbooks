script_dir =  File.expand_path(File.dirname(__FILE__))
include_recipe "#{script_dir}/cookbook/mac/setup.rb"
include_recipe "#{script_dir}/cookbook/mac/embulk.rb"