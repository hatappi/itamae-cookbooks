script_dir =  File.expand_path(File.dirname(__FILE__))
include_recipe "#{script_dir}/cookbook/mac/setup.rb"
include_recipe "#{script_dir}/cookbook/mac/python.rb"
include_recipe "#{script_dir}/cookbook/mac/mysql.rb"
include_recipe "#{script_dir}/cookbook/mac/airflow.rb"